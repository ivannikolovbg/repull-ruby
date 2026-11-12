=begin
#Repull API

#The unified API for vacation rental tech. Connect Airbnb, Booking.com, Vrbo and more channels, plus 14 PMS platforms, through one REST API.  ## Designed for AI agents Every error response on this API includes machine-parseable fields so an LLM (Claude in MCP, Cursor, Cline, GPT, etc.) can self-recover without escalating to a human: - `error.code` — stable string identifier (e.g. `invalid_params`, `rate_limit_exceeded`) - `error.message` — human-readable cause - `error.fix` — exact recovery steps (e.g. \"Pass `check_in_after` as ISO 8601: `?check_in_after=2026-01-15`\") - `error.docs_url` — link to the canonical write-up at `https://repull.dev/docs/errors/{code}` - `error.request_id` — id to correlate with server-side logs - `error.field` / `error.value_received` / `error.valid_values` / `error.did_you_mean` — when the error is parameter-specific - `error.retry_after` — seconds to wait before retrying (rate-limit + transient upstream)  `Access-Control-Expose-Headers` lists `x-request-id` and the `X-RateLimit-*` family so browsers can read them on cross-origin responses.  ## Quick Start 1. Get an API key at https://repull.dev/dashboard 2. Connect a PMS: `POST /v1/connect/{provider}` 3. List properties: `GET /v1/properties` 4. Get reservations: `GET /v1/reservations`  ## Authentication All requests require a Bearer token: ``` Authorization: Bearer sk_live_YOUR_API_KEY ```  ## Request Correlation (X-Request-ID) Every response carries an `X-Request-ID` header, e.g. `X-Request-ID: req_01HXY...`. Include this id in support tickets and bug reports — we can trace the full request lifecycle (auth, rate limit, handler, downstream calls, log row) from a single id.  You may set the header on the inbound request to forward your own trace id; we will echo it back instead of generating a new one. Accepted format: `^[\\\\w.-]{1,128}$`.  The id is also embedded in error envelopes as `request_id` so server-side log diffs work even when the response headers are stripped by an intermediate proxy.  ## Rate Limits The public API enforces a per-API-key sliding-window rate limit on top of the per-tier monthly + daily-AI quotas.  **Default policy:** 600 requests per 60 seconds, per API key. Sliding window — there is no fixed-minute boundary you can burst across.  Every response includes:  | Header | Meaning | |---|---| | `X-RateLimit-Limit` | Requests permitted in the current window. | | `X-RateLimit-Remaining` | Requests left in the current window after this call. | | `X-RateLimit-Reset` | Unix epoch (seconds) when the next slot opens. | | `X-RateLimit-Policy` | Machine-readable policy descriptor, e.g. `600;w=60`. | | `Retry-After` | Seconds to wait before retrying. **Only present on 429 responses.** |  **On 429 (rate_limit_exceeded):** the response body matches the standard error envelope with `code: \"rate_limit_exceeded\"`, plus `limit`, `window_seconds`, `retry_after`, and `request_id` fields. SDKs MUST honor `Retry-After` and use exponential backoff with jitter on subsequent retries — never a tight loop.  Recommended backoff: ``` sleep_ms = (Retry-After * 1000) + random(0..250) ```  Monthly + daily-AI tier quotas (`free`, `starter`, `custom`) are enforced separately and also surface as 429s; they include `tier`, `scope`, `limit`, `used` and `resets_at` fields.  **The way past a request quota.** The monthly quota refusal (`429 rate_limit_exceeded` with `scope: \"monthly\"`), `402 credits_exhausted` and `429 daily_limit_exceeded` also carry `upgrade` (the cheapest plan that covers your usage: its exact monthly price for your listings, its request quotas and a `checkout_url` that opens checkout for that price; `plan: \"custom\"` with a `contact_email` when no self-serve plan covers it), `credits` (pay-as-you-go: `usd_per_1000_requests`, `top_up_url`, your `balance_usd`), `resets_at` and `projected_monthly_requests`. The per-minute 429 (`scope: \"per_api_key\"`) carries none of these: wait `Retry-After`.  ## Plan listing limits Each plan includes a number of **active listings**:  | Tier | Active listings | |---|---| | `free` | 3 | | `starter` | no cap: 10 included, then billed per listing | | `custom` | no cap |  Going over the plan never blocks your API calls. Listings beyond the plan are **held back**: they stay connected and keep syncing, but they are not served. A held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`, and collection routes leave it out. Every JSON response then carries a `planNotice` and the `X-Repull-Listings-Held-Back` header, so you know there is more to see.  Choose which listings are active with `POST /v1/listings/status`. Upgrading at `https://repull.dev/dashboard/billing` lifts the cap but does not switch held-back listings on: you choose which to activate afterwards, with the same call or from the dashboard, and each one you switch on is billed from then.  Only a call that would itself take you over the plan is refused, with **`402 listings_limit_exceeded`**: activating listings (`PATCH /v1/listings/{id}` with `{ \"active\": true }`, `POST /v1/listings/status`) or creating one (`POST /v1/listings`). Nothing else changes. The envelope carries the tier, the limit, the active count and an upgrade link next to the standard `code` / `message` / `fix` / `docs_url` / `request_id`.  If an account has more active listings than its plan (for example after a downgrade), calls are still served and `planNotice` says so (code \"listings_over_plan\").  ## Failed payments If your plan's renewal payment fails, nothing is blocked: your API calls keep working while Stripe retries the card. Every successful JSON response then carries a `billingNotice` (code `payment_failed`) with the amount, when it failed, the next automatic retry (`nextRetryAt`) and `payUrl`, the invoice to pay. It disappears once the invoice is paid.

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.22.0

=end

require 'cgi'

module Repull
  class ConnectionsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Map, unmap or create listings for units
    # One instruction per unit: `{unitId, listingId}` maps, `{unitId, listingId: null}` unmaps, `{unitId, create: true}` creates a listing. Answers per unit.  Vrbo: nothing is imported when the account is signed in. Applying a mapping that maps at least one unit starts the import: upcoming bookings and the last 30 days of messages first, then the whole account history. Follow it on `GET /v1/connect/vrbo-login` (`accounts[].import`).  Auth: a Repull API key, or a Connect session token (`sessionId`) while the hosted flow is mapping.
    # @param id [String] Connection handle &#x60;{channel}:{externalAccountId}&#x60;, where &#x60;externalAccountId&#x60; is the platform&#39;s own account id: &#x60;booking_extranet:20123456&#x60; (the Booking.com account id) or &#x60;vrbo:7001234&#x60; (the Vrbo account id). The old forms with our login id (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still resolve until 2027-02-12 and are never returned.
    # @param apply_connection_mappings_request [ApplyConnectionMappingsRequest] 
    # @param [Hash] opts the optional parameters
    # @return [ApplyConnectionMappings200Response]
    def apply_connection_mappings(id, apply_connection_mappings_request, opts = {})
      data, _status_code, _headers = apply_connection_mappings_with_http_info(id, apply_connection_mappings_request, opts)
      data
    end

    # Map, unmap or create listings for units
    # One instruction per unit: &#x60;{unitId, listingId}&#x60; maps, &#x60;{unitId, listingId: null}&#x60; unmaps, &#x60;{unitId, create: true}&#x60; creates a listing. Answers per unit.  Vrbo: nothing is imported when the account is signed in. Applying a mapping that maps at least one unit starts the import: upcoming bookings and the last 30 days of messages first, then the whole account history. Follow it on &#x60;GET /v1/connect/vrbo-login&#x60; (&#x60;accounts[].import&#x60;).  Auth: a Repull API key, or a Connect session token (&#x60;sessionId&#x60;) while the hosted flow is mapping.
    # @param id [String] Connection handle &#x60;{channel}:{externalAccountId}&#x60;, where &#x60;externalAccountId&#x60; is the platform&#39;s own account id: &#x60;booking_extranet:20123456&#x60; (the Booking.com account id) or &#x60;vrbo:7001234&#x60; (the Vrbo account id). The old forms with our login id (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still resolve until 2027-02-12 and are never returned.
    # @param apply_connection_mappings_request [ApplyConnectionMappingsRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ApplyConnectionMappings200Response, Integer, Hash)>] ApplyConnectionMappings200Response data, response status code and response headers
    def apply_connection_mappings_with_http_info(id, apply_connection_mappings_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConnectionsApi.apply_connection_mappings ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ConnectionsApi.apply_connection_mappings"
      end
      # verify the required parameter 'apply_connection_mappings_request' is set
      if @api_client.config.client_side_validation && apply_connection_mappings_request.nil?
        fail ArgumentError, "Missing the required parameter 'apply_connection_mappings_request' when calling ConnectionsApi.apply_connection_mappings"
      end
      # resource path
      local_var_path = '/v1/connections/{id}/mappings'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(apply_connection_mappings_request)

      # return_type
      return_type = opts[:debug_return_type] || 'ApplyConnectionMappings200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ConnectionsApi.apply_connection_mappings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConnectionsApi#apply_connection_mappings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Auto-map units by exact name
    # Proposes (or with `apply: true` applies) mappings where a unit's name exactly matches one listing. Never guesses on ambiguity.  Auth: a Repull API key, or a Connect session token (`sessionId`) while the hosted flow is mapping.
    # @param id [String] Connection handle &#x60;{channel}:{externalAccountId}&#x60;, where &#x60;externalAccountId&#x60; is the platform&#39;s own account id: &#x60;booking_extranet:20123456&#x60; (the Booking.com account id) or &#x60;vrbo:7001234&#x60; (the Vrbo account id). The old forms with our login id (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still resolve until 2027-02-12 and are never returned.
    # @param [Hash] opts the optional parameters
    # @option opts [AutoMapConnectionUnitsRequest] :auto_map_connection_units_request 
    # @return [AutoMapConnectionUnits200Response]
    def auto_map_connection_units(id, opts = {})
      data, _status_code, _headers = auto_map_connection_units_with_http_info(id, opts)
      data
    end

    # Auto-map units by exact name
    # Proposes (or with &#x60;apply: true&#x60; applies) mappings where a unit&#39;s name exactly matches one listing. Never guesses on ambiguity.  Auth: a Repull API key, or a Connect session token (&#x60;sessionId&#x60;) while the hosted flow is mapping.
    # @param id [String] Connection handle &#x60;{channel}:{externalAccountId}&#x60;, where &#x60;externalAccountId&#x60; is the platform&#39;s own account id: &#x60;booking_extranet:20123456&#x60; (the Booking.com account id) or &#x60;vrbo:7001234&#x60; (the Vrbo account id). The old forms with our login id (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still resolve until 2027-02-12 and are never returned.
    # @param [Hash] opts the optional parameters
    # @option opts [AutoMapConnectionUnitsRequest] :auto_map_connection_units_request 
    # @return [Array<(AutoMapConnectionUnits200Response, Integer, Hash)>] AutoMapConnectionUnits200Response data, response status code and response headers
    def auto_map_connection_units_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConnectionsApi.auto_map_connection_units ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ConnectionsApi.auto_map_connection_units"
      end
      # resource path
      local_var_path = '/v1/connections/{id}/mappings/automap'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'auto_map_connection_units_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'AutoMapConnectionUnits200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ConnectionsApi.auto_map_connection_units",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConnectionsApi#auto_map_connection_units\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List a connection's imports
    # The import runs of one connected account, newest first: the first sync after connecting, a room or unit mapped later, a reconnect, a re-sync. Each run says where it stands (`running`, `completed`, `failed`), its stages and what it imported.  To know when an account's first sync is done, wait for the `account.import.completed` webhook, or poll this endpoint (or `GET /v1/connect`, whose connections carry their latest `import`) until the newest run is no longer `running`.  Auth: a Repull API key, or a Connect session token (`sessionId`).
    # @param id [String] Connection handle &#x60;{provider}:{externalAccountId}&#x60;, e.g. &#x60;booking_extranet:20123456&#x60;, &#x60;vrbo:7001234&#x60;, &#x60;airbnb:1234567&#x60;, &#x60;hostaway:27434&#x60; (&#x60;externalAccountId&#x60; is always the platform&#39;s own account id; the old Extranet / Vrbo login-id forms resolve until 2027-02-12) — the &#x60;provider&#x60; and &#x60;externalAccountId&#x60; of a connection on &#x60;GET /v1/connect&#x60;, or the account of an &#x60;account.*&#x60; webhook.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit How many runs to return, newest first. (default to 20)
    # @option opts [String] :session_id The Connect session ID (capability token).
    # @return [ListConnectionImports200Response]
    def list_connection_imports(id, opts = {})
      data, _status_code, _headers = list_connection_imports_with_http_info(id, opts)
      data
    end

    # List a connection&#39;s imports
    # The import runs of one connected account, newest first: the first sync after connecting, a room or unit mapped later, a reconnect, a re-sync. Each run says where it stands (&#x60;running&#x60;, &#x60;completed&#x60;, &#x60;failed&#x60;), its stages and what it imported.  To know when an account&#39;s first sync is done, wait for the &#x60;account.import.completed&#x60; webhook, or poll this endpoint (or &#x60;GET /v1/connect&#x60;, whose connections carry their latest &#x60;import&#x60;) until the newest run is no longer &#x60;running&#x60;.  Auth: a Repull API key, or a Connect session token (&#x60;sessionId&#x60;).
    # @param id [String] Connection handle &#x60;{provider}:{externalAccountId}&#x60;, e.g. &#x60;booking_extranet:20123456&#x60;, &#x60;vrbo:7001234&#x60;, &#x60;airbnb:1234567&#x60;, &#x60;hostaway:27434&#x60; (&#x60;externalAccountId&#x60; is always the platform&#39;s own account id; the old Extranet / Vrbo login-id forms resolve until 2027-02-12) — the &#x60;provider&#x60; and &#x60;externalAccountId&#x60; of a connection on &#x60;GET /v1/connect&#x60;, or the account of an &#x60;account.*&#x60; webhook.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit How many runs to return, newest first. (default to 20)
    # @option opts [String] :session_id The Connect session ID (capability token).
    # @return [Array<(ListConnectionImports200Response, Integer, Hash)>] ListConnectionImports200Response data, response status code and response headers
    def list_connection_imports_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConnectionsApi.list_connection_imports ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ConnectionsApi.list_connection_imports"
      end
      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling ConnectionsApi.list_connection_imports, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling ConnectionsApi.list_connection_imports, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/v1/connections/{id}/imports'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'sessionId'] = opts[:'session_id'] if !opts[:'session_id'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListConnectionImports200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ConnectionsApi.list_connection_imports",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConnectionsApi#list_connection_imports\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List a connection's mappable units
    # The units of a connected account with their current listing, a safe suggestion, and the workspace's listing options. `status: ready` with no units means the account has no properties.  Auth: a Repull API key, or a Connect session token (`sessionId`) while the hosted flow is mapping.  `listing_options` carries only the listings the units already point at (mapped or suggested); `listing_options_total` says how many the workspace has. Search the rest with `GET /v1/connections/{id}/listing-options?q=`.
    # @param id [String] Connection handle &#x60;{channel}:{externalAccountId}&#x60;, where &#x60;externalAccountId&#x60; is the platform&#39;s own account id: &#x60;booking_extranet:20123456&#x60; (the Booking.com account id) or &#x60;vrbo:7001234&#x60; (the Vrbo account id). The old forms with our login id (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still resolve until 2027-02-12 and are never returned.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :session_id The Connect session ID (capability token).
    # @return [ListConnectionUnits200Response]
    def list_connection_units(id, opts = {})
      data, _status_code, _headers = list_connection_units_with_http_info(id, opts)
      data
    end

    # List a connection&#39;s mappable units
    # The units of a connected account with their current listing, a safe suggestion, and the workspace&#39;s listing options. &#x60;status: ready&#x60; with no units means the account has no properties.  Auth: a Repull API key, or a Connect session token (&#x60;sessionId&#x60;) while the hosted flow is mapping.  &#x60;listing_options&#x60; carries only the listings the units already point at (mapped or suggested); &#x60;listing_options_total&#x60; says how many the workspace has. Search the rest with &#x60;GET /v1/connections/{id}/listing-options?q&#x3D;&#x60;.
    # @param id [String] Connection handle &#x60;{channel}:{externalAccountId}&#x60;, where &#x60;externalAccountId&#x60; is the platform&#39;s own account id: &#x60;booking_extranet:20123456&#x60; (the Booking.com account id) or &#x60;vrbo:7001234&#x60; (the Vrbo account id). The old forms with our login id (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still resolve until 2027-02-12 and are never returned.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :session_id The Connect session ID (capability token).
    # @return [Array<(ListConnectionUnits200Response, Integer, Hash)>] ListConnectionUnits200Response data, response status code and response headers
    def list_connection_units_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConnectionsApi.list_connection_units ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ConnectionsApi.list_connection_units"
      end
      # resource path
      local_var_path = '/v1/connections/{id}/units'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'sessionId'] = opts[:'session_id'] if !opts[:'session_id'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListConnectionUnits200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ConnectionsApi.list_connection_units",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConnectionsApi#list_connection_units\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search listings a unit can be mapped to
    # Search the workspace's active listings by name, city or id, for a mapping picker. A workspace can hold tens of thousands of listings, so pickers search here as the user types rather than loading them all. Empty `q` returns the first `limit` listings by name.  Auth: a Repull API key, or a Connect session token (`sessionId`) while the hosted flow is mapping.
    # @param id [String] Connection handle &#x60;{channel}:{externalAccountId}&#x60;, where &#x60;externalAccountId&#x60; is the platform&#39;s own account id: &#x60;booking_extranet:20123456&#x60; (the Booking.com account id) or &#x60;vrbo:7001234&#x60; (the Vrbo account id). The old forms with our login id (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still resolve until 2027-02-12 and are never returned.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :q Text to match (name, city or listing id).
    # @option opts [Integer] :limit  (default to 20)
    # @option opts [String] :session_id 
    # @return [SearchConnectionListingOptions200Response]
    def search_connection_listing_options(id, opts = {})
      data, _status_code, _headers = search_connection_listing_options_with_http_info(id, opts)
      data
    end

    # Search listings a unit can be mapped to
    # Search the workspace&#39;s active listings by name, city or id, for a mapping picker. A workspace can hold tens of thousands of listings, so pickers search here as the user types rather than loading them all. Empty &#x60;q&#x60; returns the first &#x60;limit&#x60; listings by name.  Auth: a Repull API key, or a Connect session token (&#x60;sessionId&#x60;) while the hosted flow is mapping.
    # @param id [String] Connection handle &#x60;{channel}:{externalAccountId}&#x60;, where &#x60;externalAccountId&#x60; is the platform&#39;s own account id: &#x60;booking_extranet:20123456&#x60; (the Booking.com account id) or &#x60;vrbo:7001234&#x60; (the Vrbo account id). The old forms with our login id (&#x60;booking_extranet:88&#x60;, &#x60;vrbo:46&#x60;) still resolve until 2027-02-12 and are never returned.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :q Text to match (name, city or listing id).
    # @option opts [Integer] :limit  (default to 20)
    # @option opts [String] :session_id 
    # @return [Array<(SearchConnectionListingOptions200Response, Integer, Hash)>] SearchConnectionListingOptions200Response data, response status code and response headers
    def search_connection_listing_options_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ConnectionsApi.search_connection_listing_options ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ConnectionsApi.search_connection_listing_options"
      end
      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 50
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling ConnectionsApi.search_connection_listing_options, must be smaller than or equal to 50.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling ConnectionsApi.search_connection_listing_options, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/v1/connections/{id}/listing-options'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'q'] = opts[:'q'] if !opts[:'q'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'sessionId'] = opts[:'session_id'] if !opts[:'session_id'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'SearchConnectionListingOptions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ConnectionsApi.search_connection_listing_options",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ConnectionsApi#search_connection_listing_options\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
