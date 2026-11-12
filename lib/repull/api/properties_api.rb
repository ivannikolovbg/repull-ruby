=begin
#Repull API

#The unified API for vacation rental tech. Connect Airbnb, Booking.com, Vrbo and more channels, plus 14 PMS platforms, through one REST API.  ## Designed for AI agents Every error response on this API includes machine-parseable fields so an LLM (Claude in MCP, Cursor, Cline, GPT, etc.) can self-recover without escalating to a human: - `error.code` — stable string identifier (e.g. `invalid_params`, `rate_limit_exceeded`) - `error.message` — human-readable cause - `error.fix` — exact recovery steps (e.g. \"Pass `check_in_after` as ISO 8601: `?check_in_after=2026-01-15`\") - `error.docs_url` — link to the canonical write-up at `https://repull.dev/docs/errors/{code}` - `error.request_id` — id to correlate with server-side logs - `error.field` / `error.value_received` / `error.valid_values` / `error.did_you_mean` — when the error is parameter-specific - `error.retry_after` — seconds to wait before retrying (rate-limit + transient upstream)  `Access-Control-Expose-Headers` lists `x-request-id` and the `X-RateLimit-*` family so browsers can read them on cross-origin responses.  ## Quick Start 1. Get an API key at https://repull.dev/dashboard 2. Connect a PMS: `POST /v1/connect/{provider}` 3. List properties: `GET /v1/properties` 4. Get reservations: `GET /v1/reservations`  ## Authentication All requests require a Bearer token: ``` Authorization: Bearer sk_live_YOUR_API_KEY ```  ## Request Correlation (X-Request-ID) Every response carries an `X-Request-ID` header, e.g. `X-Request-ID: req_01HXY...`. Include this id in support tickets and bug reports — we can trace the full request lifecycle (auth, rate limit, handler, downstream calls, log row) from a single id.  You may set the header on the inbound request to forward your own trace id; we will echo it back instead of generating a new one. Accepted format: `^[\\\\w.-]{1,128}$`.  The id is also embedded in error envelopes as `request_id` so server-side log diffs work even when the response headers are stripped by an intermediate proxy.  ## Rate Limits The public API enforces a per-API-key sliding-window rate limit on top of the per-tier monthly + daily-AI quotas.  **Default policy:** 600 requests per 60 seconds, per API key. Sliding window — there is no fixed-minute boundary you can burst across.  Every response includes:  | Header | Meaning | |---|---| | `X-RateLimit-Limit` | Requests permitted in the current window. | | `X-RateLimit-Remaining` | Requests left in the current window after this call. | | `X-RateLimit-Reset` | Unix epoch (seconds) when the next slot opens. | | `X-RateLimit-Policy` | Machine-readable policy descriptor, e.g. `600;w=60`. | | `Retry-After` | Seconds to wait before retrying. **Only present on 429 responses.** |  **On 429 (rate_limit_exceeded):** the response body matches the standard error envelope with `code: \"rate_limit_exceeded\"`, plus `limit`, `window_seconds`, `retry_after`, and `request_id` fields. SDKs MUST honor `Retry-After` and use exponential backoff with jitter on subsequent retries — never a tight loop.  Recommended backoff: ``` sleep_ms = (Retry-After * 1000) + random(0..250) ```  Monthly + daily-AI tier quotas (`free`, `starter`, `custom`) are enforced separately and also surface as 429s; they include `tier`, `scope`, `limit`, `used` and `resets_at` fields.  **The way past a request quota.** The monthly quota refusal (`429 rate_limit_exceeded` with `scope: \"monthly\"`), `402 credits_exhausted` and `429 daily_limit_exceeded` also carry `upgrade` (the cheapest plan that covers your usage: its exact monthly price for your listings, its request quotas and a `checkout_url` that opens checkout for that price; `plan: \"custom\"` with a `contact_email` when no self-serve plan covers it), `credits` (pay-as-you-go: `usd_per_1000_requests`, `top_up_url`, your `balance_usd`), `resets_at` and `projected_monthly_requests`. The per-minute 429 (`scope: \"per_api_key\"`) carries none of these: wait `Retry-After`.  ## Plan listing limits Each plan includes a number of **active listings**:  | Tier | Active listings | |---|---| | `free` | 3 | | `starter` | no cap: 10 included, then billed per listing | | `custom` | no cap |  Going over the plan never blocks your API calls. Listings beyond the plan are **held back**: they stay connected and keep syncing, but they are not served. A held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`, and collection routes leave it out. Every JSON response then carries a `planNotice` and the `X-Repull-Listings-Held-Back` header, so you know there is more to see.  Choose which listings are active with `POST /v1/listings/status`. Upgrading at `https://repull.dev/dashboard/billing` lifts the cap but does not switch held-back listings on: you choose which to activate afterwards, with the same call or from the dashboard, and each one you switch on is billed from then.  Only a call that would itself take you over the plan is refused, with **`402 listings_limit_exceeded`**: activating listings (`PATCH /v1/listings/{id}` with `{ \"active\": true }`, `POST /v1/listings/status`) or creating one (`POST /v1/listings`). Nothing else changes. The envelope carries the tier, the limit, the active count and an upgrade link next to the standard `code` / `message` / `fix` / `docs_url` / `request_id`.  If an account has more active listings than its plan (for example after a downgrade), calls are still served and `planNotice` says so (code \"listings_over_plan\").

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.22.0

=end

require 'cgi'

module Repull
  class PropertiesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get property details (older name for /v1/listings/{id})
    # **`/v1/properties` is the older name for `/v1/listings`** — the same listings, the same ids. It stays for existing integrations; new code should use `/v1/listings`, which is where create, content, publishing and markups live.  Fetch a single property by Repull id. Property ids are workspace-scoped — an id from one workspace is not valid in another. 404 means the id does not exist OR belongs to a different workspace.  **Optional expansions:** Pass `?include=amenities` to enrich the response with the property's amenities (sourced from the unified `listings_amenities` table). Returns `[]` when the property has no amenity rows. The default response stays lean; consumers must opt in.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.
    # @param id [Integer] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :include Comma-separated optional expansions. Currently supported: &#x60;amenities&#x60;. Unknown values return 422.
    # @return [Property]
    def get_property(id, opts = {})
      data, _status_code, _headers = get_property_with_http_info(id, opts)
      data
    end

    # Get property details (older name for /v1/listings/{id})
    # **&#x60;/v1/properties&#x60; is the older name for &#x60;/v1/listings&#x60;** — the same listings, the same ids. It stays for existing integrations; new code should use &#x60;/v1/listings&#x60;, which is where create, content, publishing and markups live.  Fetch a single property by Repull id. Property ids are workspace-scoped — an id from one workspace is not valid in another. 404 means the id does not exist OR belongs to a different workspace.  **Optional expansions:** Pass &#x60;?include&#x3D;amenities&#x60; to enrich the response with the property&#39;s amenities (sourced from the unified &#x60;listings_amenities&#x60; table). Returns &#x60;[]&#x60; when the property has no amenity rows. The default response stays lean; consumers must opt in.  Returns &#x60;403 listing_inactive&#x60; when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.
    # @param id [Integer] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :include Comma-separated optional expansions. Currently supported: &#x60;amenities&#x60;. Unknown values return 422.
    # @return [Array<(Property, Integer, Hash)>] Property data, response status code and response headers
    def get_property_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PropertiesApi.get_property ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PropertiesApi.get_property"
      end
      allowable_values = ["amenities"]
      if @api_client.config.client_side_validation && opts[:'include'] && !allowable_values.include?(opts[:'include'])
        fail ArgumentError, "invalid value for \"include\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/properties/{id}'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'include'] = opts[:'include'] if !opts[:'include'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Property'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"PropertiesApi.get_property",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PropertiesApi#get_property\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List properties (older name for /v1/listings)
    # **`/v1/properties` is the older name for `/v1/listings`** — the same listings, the same ids. It stays for existing integrations; new code should use `/v1/listings`, which is where create, content, publishing and markups live.  Cursor-paginated list of properties for the authenticated workspace. Walk pages with `?cursor=<pagination.nextCursor>`; stop when `pagination.hasMore` is `false`. Cursor is opaque base64 — do not parse it.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.  Filters: `q` (substring on name/street/city), `status` (active|inactive|all), `lifecycle_status` (exact match on the listing's lifecycle state). Other unknown params (e.g. `?search=` or `?propertyId=`) are rejected with 422 — no silent unfiltered results.  **Incremental sync (only changes since last poll):** pass `?updated_since=<ISO8601>` to receive only properties changed at or after that instant. Each property carries `updatedAt` — the last row of the final page is your next watermark. `updated_since` changes the page ordering to `updatedAt ASC, id ASC` (and the cursor with it); see the parameter description. `GET /v1/listings` does NOT yet accept `updated_since` — use this endpoint for property-side incremental sync.  **Inactive properties:** an inactive property keeps syncing, but cannot be read or changed through the API until it is activated. They are only listed when `status` asks for them, and then with `id`, `name`, `status`, `lifecycleStatus`, `channels` and `updatedAt` only — enough to choose what to activate with `PATCH /v1/listings/{id}`.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :account Only the records of one connected account, as &#x60;provider:externalAccountId&#x60; — the pair from a webhook &#x60;account&#x60; block, &#x60;connect.session.completed&#x60;, or &#x60;GET /v1/connect/{provider}&#x60; → &#x60;accounts&#x60;. &#x60;externalAccountId&#x60; is the platform&#39;s own id (e.g. &#x60;airbnb:79730216&#x60;, &#x60;booking:17627428&#x60;, &#x60;booking_extranet:20123456&#x60;). The old Extranet / Vrbo login ids (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still work until 2027-02-12. A record belongs to an account when it is on that account&#39;s listings and on its channel (a PMS account: came in through that PMS). An account with no listings returns an empty page.
    # @option opts [Integer] :limit Page size (max 100). Requests over the cap return 422. (default to 50)
    # @option opts [String] :cursor Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page.
    # @option opts [Integer] :offset First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. (default to 0)
    # @option opts [String] :q Case-insensitive substring search on name, street, or city.
    # @option opts [String] :status Filter by status. Default returns active only; pass &#x60;inactive&#x60; to invert or &#x60;all&#x60; to include both. Inactive properties carry identity fields only — &#x60;id&#x60;, &#x60;name&#x60;, &#x60;city&#x60;, &#x60;status&#x60;, &#x60;inactiveReason&#x60; (&#x60;plan_limit&#x60;, &#x60;unlisted_on_airbnb&#x60; or &#x60;deactivated&#x60;), &#x60;lifecycleStatus&#x60;, &#x60;channels&#x60; and &#x60;updatedAt&#x60; — never &#x60;address&#x60; or &#x60;currency&#x60;. (default to 'active')
    # @option opts [String] :lifecycle_status Filter by lifecycle status (e.g. &#x60;live&#x60;, &#x60;draft&#x60;, &#x60;archived&#x60;). Pass &#x60;all&#x60; to disable the filter.
    # @option opts [String] :channel Filter to properties with an active link on the given OTA/channel (airbnb, booking, vrbo). Omit to include every channel. Each property also returns a &#x60;channels&#x60; array listing the OTAs it is published on.
    # @option opts [Time] :updated_since Incremental sync: return only records whose &#x60;updatedAt&#x60; is at or after this instant. This is the only filter on record **mutation** time — every &#x60;check_*&#x60; filter targets guest **stay** dates.  **Accepted formats.** ISO 8601, with &#x60;Z&#x60; or a numeric offset — both work: - &#x60;2026-08-01T00:00:00Z&#x60; - &#x60;2026-08-01T00:00:00.123Z&#x60; - &#x60;2026-08-01T00:00:00+00:00&#x60; - &#x60;2026-08-01T02:30:00-07:00&#x60; (offset colon optional: &#x60;-0700&#x60;) - &#x60;2026-08-01T00:00&#x60; (seconds optional) - &#x60;2026-08-01T00:00:00&#x60; — no zone designator, interpreted as **UTC** - &#x60;2026-08-01&#x60; — date only, means midnight UTC  Anything else returns 422 &#x60;invalid_params&#x60; naming the field; the value is never silently ignored.  **Ordering changes when you pass this.** Results are ordered &#x60;updatedAt ASC, id ASC&#x60; (instead of the endpoint default) and the cursor keys on the same pair. That is required for correctness: under the default ordering a record amended mid-walk can move behind the cursor and never be emitted — which is exactly the event you are polling for. Ascending mutation time is monotonic with the cursor, so anything touched during a walk resurfaces later in it or on the next poll.  **Cursors are not interchangeable between the two orderings.** Keep &#x60;updated_since&#x60; on every page of an incremental walk; replaying a cursor from the other ordering returns 422 rather than a page that silently skips rows.  **Watermark.** The bound is inclusive (&#x60;updatedAt &gt;&#x3D; value&#x60;), so the last row of the final page is the watermark for the next poll — re-polling with it re-emits that row. Delivery is at-least-once; upsert by &#x60;id&#x60;.
    # @option opts [Boolean] :include_total When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. (default to true)
    # @return [PropertyListResponse]
    def list_properties(opts = {})
      data, _status_code, _headers = list_properties_with_http_info(opts)
      data
    end

    # List properties (older name for /v1/listings)
    # **&#x60;/v1/properties&#x60; is the older name for &#x60;/v1/listings&#x60;** — the same listings, the same ids. It stays for existing integrations; new code should use &#x60;/v1/listings&#x60;, which is where create, content, publishing and markups live.  Cursor-paginated list of properties for the authenticated workspace. Walk pages with &#x60;?cursor&#x3D;&lt;pagination.nextCursor&gt;&#x60;; stop when &#x60;pagination.hasMore&#x60; is &#x60;false&#x60;. Cursor is opaque base64 — do not parse it.  &#x60;?offset&#x3D;&#x60; is also accepted as a first-class alias for shallow paging (0..10000) — see the &#x60;offset&#x60; parameter below. Mutually exclusive with &#x60;cursor&#x60;.  Filters: &#x60;q&#x60; (substring on name/street/city), &#x60;status&#x60; (active|inactive|all), &#x60;lifecycle_status&#x60; (exact match on the listing&#39;s lifecycle state). Other unknown params (e.g. &#x60;?search&#x3D;&#x60; or &#x60;?propertyId&#x3D;&#x60;) are rejected with 422 — no silent unfiltered results.  **Incremental sync (only changes since last poll):** pass &#x60;?updated_since&#x3D;&lt;ISO8601&gt;&#x60; to receive only properties changed at or after that instant. Each property carries &#x60;updatedAt&#x60; — the last row of the final page is your next watermark. &#x60;updated_since&#x60; changes the page ordering to &#x60;updatedAt ASC, id ASC&#x60; (and the cursor with it); see the parameter description. &#x60;GET /v1/listings&#x60; does NOT yet accept &#x60;updated_since&#x60; — use this endpoint for property-side incremental sync.  **Inactive properties:** an inactive property keeps syncing, but cannot be read or changed through the API until it is activated. They are only listed when &#x60;status&#x60; asks for them, and then with &#x60;id&#x60;, &#x60;name&#x60;, &#x60;status&#x60;, &#x60;lifecycleStatus&#x60;, &#x60;channels&#x60; and &#x60;updatedAt&#x60; only — enough to choose what to activate with &#x60;PATCH /v1/listings/{id}&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :account Only the records of one connected account, as &#x60;provider:externalAccountId&#x60; — the pair from a webhook &#x60;account&#x60; block, &#x60;connect.session.completed&#x60;, or &#x60;GET /v1/connect/{provider}&#x60; → &#x60;accounts&#x60;. &#x60;externalAccountId&#x60; is the platform&#39;s own id (e.g. &#x60;airbnb:79730216&#x60;, &#x60;booking:17627428&#x60;, &#x60;booking_extranet:20123456&#x60;). The old Extranet / Vrbo login ids (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still work until 2027-02-12. A record belongs to an account when it is on that account&#39;s listings and on its channel (a PMS account: came in through that PMS). An account with no listings returns an empty page.
    # @option opts [Integer] :limit Page size (max 100). Requests over the cap return 422. (default to 50)
    # @option opts [String] :cursor Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. Omit to fetch the first page.
    # @option opts [Integer] :offset First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. (default to 0)
    # @option opts [String] :q Case-insensitive substring search on name, street, or city.
    # @option opts [String] :status Filter by status. Default returns active only; pass &#x60;inactive&#x60; to invert or &#x60;all&#x60; to include both. Inactive properties carry identity fields only — &#x60;id&#x60;, &#x60;name&#x60;, &#x60;city&#x60;, &#x60;status&#x60;, &#x60;inactiveReason&#x60; (&#x60;plan_limit&#x60;, &#x60;unlisted_on_airbnb&#x60; or &#x60;deactivated&#x60;), &#x60;lifecycleStatus&#x60;, &#x60;channels&#x60; and &#x60;updatedAt&#x60; — never &#x60;address&#x60; or &#x60;currency&#x60;. (default to 'active')
    # @option opts [String] :lifecycle_status Filter by lifecycle status (e.g. &#x60;live&#x60;, &#x60;draft&#x60;, &#x60;archived&#x60;). Pass &#x60;all&#x60; to disable the filter.
    # @option opts [String] :channel Filter to properties with an active link on the given OTA/channel (airbnb, booking, vrbo). Omit to include every channel. Each property also returns a &#x60;channels&#x60; array listing the OTAs it is published on.
    # @option opts [Time] :updated_since Incremental sync: return only records whose &#x60;updatedAt&#x60; is at or after this instant. This is the only filter on record **mutation** time — every &#x60;check_*&#x60; filter targets guest **stay** dates.  **Accepted formats.** ISO 8601, with &#x60;Z&#x60; or a numeric offset — both work: - &#x60;2026-08-01T00:00:00Z&#x60; - &#x60;2026-08-01T00:00:00.123Z&#x60; - &#x60;2026-08-01T00:00:00+00:00&#x60; - &#x60;2026-08-01T02:30:00-07:00&#x60; (offset colon optional: &#x60;-0700&#x60;) - &#x60;2026-08-01T00:00&#x60; (seconds optional) - &#x60;2026-08-01T00:00:00&#x60; — no zone designator, interpreted as **UTC** - &#x60;2026-08-01&#x60; — date only, means midnight UTC  Anything else returns 422 &#x60;invalid_params&#x60; naming the field; the value is never silently ignored.  **Ordering changes when you pass this.** Results are ordered &#x60;updatedAt ASC, id ASC&#x60; (instead of the endpoint default) and the cursor keys on the same pair. That is required for correctness: under the default ordering a record amended mid-walk can move behind the cursor and never be emitted — which is exactly the event you are polling for. Ascending mutation time is monotonic with the cursor, so anything touched during a walk resurfaces later in it or on the next poll.  **Cursors are not interchangeable between the two orderings.** Keep &#x60;updated_since&#x60; on every page of an incremental walk; replaying a cursor from the other ordering returns 422 rather than a page that silently skips rows.  **Watermark.** The bound is inclusive (&#x60;updatedAt &gt;&#x3D; value&#x60;), so the last row of the final page is the watermark for the next poll — re-polling with it re-emits that row. Delivery is at-least-once; upsert by &#x60;id&#x60;.
    # @option opts [Boolean] :include_total When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. (default to true)
    # @return [Array<(PropertyListResponse, Integer, Hash)>] PropertyListResponse data, response status code and response headers
    def list_properties_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PropertiesApi.list_properties ...'
      end
      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling PropertiesApi.list_properties, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling PropertiesApi.list_properties, must be greater than or equal to 1.'
      end

      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] > 10000
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling PropertiesApi.list_properties, must be smaller than or equal to 10000.'
      end

      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] < 0
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling PropertiesApi.list_properties, must be greater than or equal to 0.'
      end

      allowable_values = ["active", "inactive", "all"]
      if @api_client.config.client_side_validation && opts[:'status'] && !allowable_values.include?(opts[:'status'])
        fail ArgumentError, "invalid value for \"status\", must be one of #{allowable_values}"
      end
      allowable_values = ["airbnb", "booking", "vrbo"]
      if @api_client.config.client_side_validation && opts[:'channel'] && !allowable_values.include?(opts[:'channel'])
        fail ArgumentError, "invalid value for \"channel\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/properties'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'account'] = opts[:'account'] if !opts[:'account'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'q'] = opts[:'q'] if !opts[:'q'].nil?
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?
      query_params[:'lifecycle_status'] = opts[:'lifecycle_status'] if !opts[:'lifecycle_status'].nil?
      query_params[:'channel'] = opts[:'channel'] if !opts[:'channel'].nil?
      query_params[:'updated_since'] = opts[:'updated_since'] if !opts[:'updated_since'].nil?
      query_params[:'include_total'] = opts[:'include_total'] if !opts[:'include_total'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PropertyListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"PropertiesApi.list_properties",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PropertiesApi#list_properties\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
