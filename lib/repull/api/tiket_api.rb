=begin
#Repull API

#The unified API for vacation rental tech. Connect Airbnb, Booking.com, Vrbo and more channels, plus 14 PMS platforms, through one REST API.  ## Designed for AI agents Every error response on this API includes machine-parseable fields so an LLM (Claude in MCP, Cursor, Cline, GPT, etc.) can self-recover without escalating to a human: - `error.code` — stable string identifier (e.g. `invalid_params`, `rate_limit_exceeded`) - `error.message` — human-readable cause - `error.fix` — exact recovery steps (e.g. \"Pass `check_in_after` as ISO 8601: `?check_in_after=2026-01-15`\") - `error.docs_url` — link to the canonical write-up at `https://repull.dev/docs/errors/{code}` - `error.request_id` — id to correlate with server-side logs - `error.field` / `error.value_received` / `error.valid_values` / `error.did_you_mean` — when the error is parameter-specific - `error.retry_after` — seconds to wait before retrying (rate-limit + transient upstream)  `Access-Control-Expose-Headers` lists `x-request-id` and the `X-RateLimit-*` family so browsers can read them on cross-origin responses.  ## Quick Start 1. Get an API key at https://repull.dev/dashboard 2. Connect a PMS: `POST /v1/connect/{provider}` 3. List properties: `GET /v1/properties` 4. Get reservations: `GET /v1/reservations`  ## Authentication All requests require a Bearer token: ``` Authorization: Bearer sk_live_YOUR_API_KEY ```  ## Request Correlation (X-Request-ID) Every response carries an `X-Request-ID` header, e.g. `X-Request-ID: req_01HXY...`. Include this id in support tickets and bug reports — we can trace the full request lifecycle (auth, rate limit, handler, downstream calls, log row) from a single id.  You may set the header on the inbound request to forward your own trace id; we will echo it back instead of generating a new one. Accepted format: `^[\\\\w.-]{1,128}$`.  The id is also embedded in error envelopes as `request_id` so server-side log diffs work even when the response headers are stripped by an intermediate proxy.  ## Rate Limits The public API enforces a per-API-key sliding-window rate limit on top of the per-tier monthly + daily-AI quotas.  **Default policy:** 600 requests per 60 seconds, per API key. Sliding window — there is no fixed-minute boundary you can burst across.  Every response includes:  | Header | Meaning | |---|---| | `X-RateLimit-Limit` | Requests permitted in the current window. | | `X-RateLimit-Remaining` | Requests left in the current window after this call. | | `X-RateLimit-Reset` | Unix epoch (seconds) when the next slot opens. | | `X-RateLimit-Policy` | Machine-readable policy descriptor, e.g. `600;w=60`. | | `Retry-After` | Seconds to wait before retrying. **Only present on 429 responses.** |  **On 429 (rate_limit_exceeded):** the response body matches the standard error envelope with `code: \"rate_limit_exceeded\"`, plus `limit`, `window_seconds`, `retry_after`, and `request_id` fields. SDKs MUST honor `Retry-After` and use exponential backoff with jitter on subsequent retries — never a tight loop.  Recommended backoff: ``` sleep_ms = (Retry-After * 1000) + random(0..250) ```  Monthly + daily-AI tier quotas (`free`, `starter`, `custom`) are enforced separately and also surface as 429s; they include `tier`, `scope`, `limit`, `used` and `resets_at` fields.  **The way past a request quota.** The monthly quota refusal (`429 rate_limit_exceeded` with `scope: \"monthly\"`), `402 credits_exhausted` and `429 daily_limit_exceeded` also carry `upgrade` (the cheapest plan that covers your usage: its exact monthly price for your listings, its request quotas and a `checkout_url` that opens checkout for that price; `plan: \"custom\"` with a `contact_email` when no self-serve plan covers it), `credits` (pay-as-you-go: `usd_per_1000_requests`, `top_up_url`, your `balance_usd`), `resets_at` and `projected_monthly_requests`. The per-minute 429 (`scope: \"per_api_key\"`) carries none of these: wait `Retry-After`.  ## Plan listing limits Each plan includes a number of **active listings**:  | Tier | Active listings | |---|---| | `free` | 3 | | `starter` | no cap: 10 included, then billed per listing | | `custom` | no cap |  Going over the plan never blocks your API calls. Listings beyond the plan are **held back**: they stay connected and keep syncing, but they are not served. A held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`, and collection routes leave it out. Every JSON response then carries a `planNotice` and the `X-Repull-Listings-Held-Back` header, so you know there is more to see.  Choose which listings are active with `POST /v1/listings/status`. Upgrading at `https://repull.dev/dashboard/billing` lifts the cap but does not switch held-back listings on: you choose which to activate afterwards, with the same call or from the dashboard, and each one you switch on is billed from then.  Only a call that would itself take you over the plan is refused, with **`402 listings_limit_exceeded`**: activating listings (`PATCH /v1/listings/{id}` with `{ \"active\": true }`, `POST /v1/listings/status`) or creating one (`POST /v1/listings`). Nothing else changes. The envelope carries the tier, the limit, the active count and an upgrade link next to the standard `code` / `message` / `fix` / `docs_url` / `request_id`.  If an account has more active listings than its plan (for example after a downgrade), calls are still served and `planNotice` says so (code \"listings_over_plan\").  ## Failed payments If your plan's renewal payment fails, nothing is blocked: your API calls keep working while Stripe retries the card. Every successful JSON response then carries a `billingNotice` (code `payment_failed`) with the amount, when it failed, the next automatic retry (`nextRetryAt`) and `payUrl`, the invoice to pay. It disappears once the invoice is paid.

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.22.0

=end

require 'cgi'

module Repull
  class TiketApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Read tiket.com rates, availability and restrictions
    # What tiket.com holds for a property over a date window, read live from tiket.com: rooms to sell and booked per room type, prices (Room Based, or per number of guests on an Occupancy Based property, and children prices) and restrictions per rate plan. One row per night, room type and rate plan.  `property_id` must be a tiket.com property connected to this workspace (`GET /v1/channels/tiket/properties`).
    # @param property_id [String] tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;).
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :start_date First night, YYYY-MM-DD. Default today.
    # @option opts [Date] :end_date Last night, YYYY-MM-DD, inclusive. Default &#x60;start_date&#x60; + &#x60;number_of_days&#x60; - 1.
    # @option opts [Integer] :number_of_days Window length when &#x60;end_date&#x60; is omitted. (default to 31)
    # @option opts [String] :room_type_code Only this tiket.com room type.
    # @option opts [String] :rate_plan_code Only this tiket.com rate plan.
    # @return [TiketAvailabilityResponse]
    def get_tiket_availability(property_id, opts = {})
      data, _status_code, _headers = get_tiket_availability_with_http_info(property_id, opts)
      data
    end

    # Read tiket.com rates, availability and restrictions
    # What tiket.com holds for a property over a date window, read live from tiket.com: rooms to sell and booked per room type, prices (Room Based, or per number of guests on an Occupancy Based property, and children prices) and restrictions per rate plan. One row per night, room type and rate plan.  &#x60;property_id&#x60; must be a tiket.com property connected to this workspace (&#x60;GET /v1/channels/tiket/properties&#x60;).
    # @param property_id [String] tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;).
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :start_date First night, YYYY-MM-DD. Default today.
    # @option opts [Date] :end_date Last night, YYYY-MM-DD, inclusive. Default &#x60;start_date&#x60; + &#x60;number_of_days&#x60; - 1.
    # @option opts [Integer] :number_of_days Window length when &#x60;end_date&#x60; is omitted. (default to 31)
    # @option opts [String] :room_type_code Only this tiket.com room type.
    # @option opts [String] :rate_plan_code Only this tiket.com rate plan.
    # @return [Array<(TiketAvailabilityResponse, Integer, Hash)>] TiketAvailabilityResponse data, response status code and response headers
    def get_tiket_availability_with_http_info(property_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.get_tiket_availability ...'
      end
      # verify the required parameter 'property_id' is set
      if @api_client.config.client_side_validation && property_id.nil?
        fail ArgumentError, "Missing the required parameter 'property_id' when calling TiketApi.get_tiket_availability"
      end
      if @api_client.config.client_side_validation && !opts[:'number_of_days'].nil? && opts[:'number_of_days'] > 366
        fail ArgumentError, 'invalid value for "opts[:"number_of_days"]" when calling TiketApi.get_tiket_availability, must be smaller than or equal to 366.'
      end

      if @api_client.config.client_side_validation && !opts[:'number_of_days'].nil? && opts[:'number_of_days'] < 1
        fail ArgumentError, 'invalid value for "opts[:"number_of_days"]" when calling TiketApi.get_tiket_availability, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/v1/channels/tiket/availability'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'property_id'] = property_id
      query_params[:'start_date'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'end_date'] = opts[:'end_date'] if !opts[:'end_date'].nil?
      query_params[:'number_of_days'] = opts[:'number_of_days'] if !opts[:'number_of_days'].nil?
      query_params[:'room_type_code'] = opts[:'room_type_code'] if !opts[:'room_type_code'].nil?
      query_params[:'rate_plan_code'] = opts[:'rate_plan_code'] if !opts[:'rate_plan_code'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TiketAvailabilityResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.get_tiket_availability",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#get_tiket_availability\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read the content Repull sent tiket.com
    # tiket.com has no API to read content back, so this is the record of what Repull sent for a property — the property, its room types and rate plans — with when each was sent and tiket.com's reference for it. Send changes with `POST /v1/listings/{id}/publish/tiket`.  Name the property with `property_id`, or with `partner_hotel_code` for a property Repull created that tiket.com has not assigned an id to yet.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :property_id tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;). Required unless &#x60;partner_hotel_code&#x60; is sent.
    # @option opts [String] :partner_hotel_code Repull&#39;s code for a property Repull created (&#x60;partnerHotelCode&#x60;).
    # @return [TiketContentResponse]
    def get_tiket_content(opts = {})
      data, _status_code, _headers = get_tiket_content_with_http_info(opts)
      data
    end

    # Read the content Repull sent tiket.com
    # tiket.com has no API to read content back, so this is the record of what Repull sent for a property — the property, its room types and rate plans — with when each was sent and tiket.com&#39;s reference for it. Send changes with &#x60;POST /v1/listings/{id}/publish/tiket&#x60;.  Name the property with &#x60;property_id&#x60;, or with &#x60;partner_hotel_code&#x60; for a property Repull created that tiket.com has not assigned an id to yet.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :property_id tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;). Required unless &#x60;partner_hotel_code&#x60; is sent.
    # @option opts [String] :partner_hotel_code Repull&#39;s code for a property Repull created (&#x60;partnerHotelCode&#x60;).
    # @return [Array<(TiketContentResponse, Integer, Hash)>] TiketContentResponse data, response status code and response headers
    def get_tiket_content_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.get_tiket_content ...'
      end
      # resource path
      local_var_path = '/v1/channels/tiket/content'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'property_id'] = opts[:'property_id'] if !opts[:'property_id'].nil?
      query_params[:'partner_hotel_code'] = opts[:'partner_hotel_code'] if !opts[:'partner_hotel_code'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TiketContentResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.get_tiket_content",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#get_tiket_content\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read tiket.com rates, availability and restrictions for a listing
    # Same as `GET /v1/channels/tiket/availability`, addressed by listing: the listing's tiket.com room type and every active rate plan of that room, read live from tiket.com.  A listing mapped on more than one tiket.com property needs `hotel_id`; without it the call returns `409 ambiguous_tiket_mapping` listing the ids.
    # @param id [Integer] Repull listing id.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :hotel_id tiket.com Hotel ID — only needed when the listing is mapped on more than one tiket.com property.
    # @option opts [Date] :start_date First night, YYYY-MM-DD. Default today.
    # @option opts [Date] :end_date Last night, YYYY-MM-DD, inclusive.
    # @option opts [Integer] :number_of_days Window length when &#x60;end_date&#x60; is omitted. (default to 31)
    # @return [TiketListingPricingResponse]
    def get_tiket_listing_pricing(id, opts = {})
      data, _status_code, _headers = get_tiket_listing_pricing_with_http_info(id, opts)
      data
    end

    # Read tiket.com rates, availability and restrictions for a listing
    # Same as &#x60;GET /v1/channels/tiket/availability&#x60;, addressed by listing: the listing&#39;s tiket.com room type and every active rate plan of that room, read live from tiket.com.  A listing mapped on more than one tiket.com property needs &#x60;hotel_id&#x60;; without it the call returns &#x60;409 ambiguous_tiket_mapping&#x60; listing the ids.
    # @param id [Integer] Repull listing id.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :hotel_id tiket.com Hotel ID — only needed when the listing is mapped on more than one tiket.com property.
    # @option opts [Date] :start_date First night, YYYY-MM-DD. Default today.
    # @option opts [Date] :end_date Last night, YYYY-MM-DD, inclusive.
    # @option opts [Integer] :number_of_days Window length when &#x60;end_date&#x60; is omitted. (default to 31)
    # @return [Array<(TiketListingPricingResponse, Integer, Hash)>] TiketListingPricingResponse data, response status code and response headers
    def get_tiket_listing_pricing_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.get_tiket_listing_pricing ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TiketApi.get_tiket_listing_pricing"
      end
      if @api_client.config.client_side_validation && !opts[:'number_of_days'].nil? && opts[:'number_of_days'] > 366
        fail ArgumentError, 'invalid value for "opts[:"number_of_days"]" when calling TiketApi.get_tiket_listing_pricing, must be smaller than or equal to 366.'
      end

      if @api_client.config.client_side_validation && !opts[:'number_of_days'].nil? && opts[:'number_of_days'] < 1
        fail ArgumentError, 'invalid value for "opts[:"number_of_days"]" when calling TiketApi.get_tiket_listing_pricing, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/v1/channels/tiket/listings/{id}/pricing'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'hotel_id'] = opts[:'hotel_id'] if !opts[:'hotel_id'].nil?
      query_params[:'start_date'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'end_date'] = opts[:'end_date'] if !opts[:'end_date'].nil?
      query_params[:'number_of_days'] = opts[:'number_of_days'] if !opts[:'number_of_days'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TiketListingPricingResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.get_tiket_listing_pricing",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#get_tiket_listing_pricing\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a tiket.com property
    # One tiket.com property connected to this workspace, by Hotel ID — same shape as an entry of `GET /v1/channels/tiket/properties`. A property connected to another workspace returns the same `404` as one that does not exist.
    # @param id [String] tiket.com Hotel ID.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :status &#x60;active&#x60; (default) hides inactive listings: they are left out of &#x60;listings&#x60;, and a room mapped to one comes back with &#x60;listingId: null&#x60; and &#x60;listingHidden: true&#x60;. &#x60;inactive&#x60; shows only inactive listings and &#x60;all&#x60; shows both. &#x60;mappingStatus&#x60; always counts every mapped room. (default to 'active')
    # @return [TiketProperty]
    def get_tiket_property(id, opts = {})
      data, _status_code, _headers = get_tiket_property_with_http_info(id, opts)
      data
    end

    # Get a tiket.com property
    # One tiket.com property connected to this workspace, by Hotel ID — same shape as an entry of &#x60;GET /v1/channels/tiket/properties&#x60;. A property connected to another workspace returns the same &#x60;404&#x60; as one that does not exist.
    # @param id [String] tiket.com Hotel ID.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :status &#x60;active&#x60; (default) hides inactive listings: they are left out of &#x60;listings&#x60;, and a room mapped to one comes back with &#x60;listingId: null&#x60; and &#x60;listingHidden: true&#x60;. &#x60;inactive&#x60; shows only inactive listings and &#x60;all&#x60; shows both. &#x60;mappingStatus&#x60; always counts every mapped room. (default to 'active')
    # @return [Array<(TiketProperty, Integer, Hash)>] TiketProperty data, response status code and response headers
    def get_tiket_property_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.get_tiket_property ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TiketApi.get_tiket_property"
      end
      allowable_values = ["active", "inactive", "all"]
      if @api_client.config.client_side_validation && opts[:'status'] && !allowable_values.include?(opts[:'status'])
        fail ArgumentError, "invalid value for \"status\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/tiket/properties/{id}'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TiketProperty'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.get_tiket_property",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#get_tiket_property\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List tiket.com properties
    # Every tiket.com property connected to this workspace, each returned once with its room types, rate plans and the listing each room type is mapped to.  A tiket.com property is a hotel or building; its room types are what guests book, and each room type maps to one Repull listing. A property whose rooms are not mapped yet is still listed, with `mappingStatus: \"unmapped\"`. Properties waiting for tiket.com to activate Repull are listed with their `activationStatus`.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :status &#x60;active&#x60; (default) hides inactive listings: they are left out of &#x60;listings&#x60;, and a room mapped to one comes back with &#x60;listingId: null&#x60; and &#x60;listingHidden: true&#x60;. &#x60;inactive&#x60; shows only inactive listings and &#x60;all&#x60; shows both. &#x60;mappingStatus&#x60; always counts every mapped room. (default to 'active')
    # @return [TiketPropertyListResponse]
    def list_tiket_properties(opts = {})
      data, _status_code, _headers = list_tiket_properties_with_http_info(opts)
      data
    end

    # List tiket.com properties
    # Every tiket.com property connected to this workspace, each returned once with its room types, rate plans and the listing each room type is mapped to.  A tiket.com property is a hotel or building; its room types are what guests book, and each room type maps to one Repull listing. A property whose rooms are not mapped yet is still listed, with &#x60;mappingStatus: \&quot;unmapped\&quot;&#x60;. Properties waiting for tiket.com to activate Repull are listed with their &#x60;activationStatus&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :status &#x60;active&#x60; (default) hides inactive listings: they are left out of &#x60;listings&#x60;, and a room mapped to one comes back with &#x60;listingId: null&#x60; and &#x60;listingHidden: true&#x60;. &#x60;inactive&#x60; shows only inactive listings and &#x60;all&#x60; shows both. &#x60;mappingStatus&#x60; always counts every mapped room. (default to 'active')
    # @return [Array<(TiketPropertyListResponse, Integer, Hash)>] TiketPropertyListResponse data, response status code and response headers
    def list_tiket_properties_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.list_tiket_properties ...'
      end
      allowable_values = ["active", "inactive", "all"]
      if @api_client.config.client_side_validation && opts[:'status'] && !allowable_values.include?(opts[:'status'])
        fail ArgumentError, "invalid value for \"status\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/tiket/properties'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TiketPropertyListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.list_tiket_properties",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#list_tiket_properties\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List a tiket.com property's room types
    # The room types of a tiket.com property, each with its rate plans and the listing it is mapped to. `roomTypeCode` is what `POST /v1/channels/tiket/listings/map` and the rates writes take.
    # @param id [String] tiket.com Hotel ID.
    # @param [Hash] opts the optional parameters
    # @return [TiketPropertyRoomsResponse]
    def list_tiket_property_rooms(id, opts = {})
      data, _status_code, _headers = list_tiket_property_rooms_with_http_info(id, opts)
      data
    end

    # List a tiket.com property&#39;s room types
    # The room types of a tiket.com property, each with its rate plans and the listing it is mapped to. &#x60;roomTypeCode&#x60; is what &#x60;POST /v1/channels/tiket/listings/map&#x60; and the rates writes take.
    # @param id [String] tiket.com Hotel ID.
    # @param [Hash] opts the optional parameters
    # @return [Array<(TiketPropertyRoomsResponse, Integer, Hash)>] TiketPropertyRoomsResponse data, response status code and response headers
    def list_tiket_property_rooms_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.list_tiket_property_rooms ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TiketApi.list_tiket_property_rooms"
      end
      # resource path
      local_var_path = '/v1/channels/tiket/properties/{id}/rooms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TiketPropertyRoomsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.list_tiket_property_rooms",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#list_tiket_property_rooms\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List tiket.com reservations as tiket.com sent them
    # tiket.com's own record of the bookings it delivered, newest first: one row per booked room (`<id>`, `<id>-2`, …) with tiket.com's ids, rate plan, meal plan, cancellation policy, what the guest paid, the net amount tiket.com pays the property, how tiket.com pays (`paymentMethod`: `Virtual Credit Card` or `Bank Transfer`), and the Repull reservation the room became.  **Cards.** Card details are never returned by the API, on this route or on `/v1/reservations`.  **Date changes.** tiket.com sends a date change as a cancellation plus a new booking. Repull applies it as a change to the original reservation, so the Repull reservation keeps its id; the new tiket.com booking carries `previousTiketReservationId`.  The same bookings, normalized like every other channel's (`source: tiket`), are on `GET /v1/reservations`.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :property_id tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;).
    # @option opts [String] :status Only &#x60;confirmed&#x60; or only &#x60;cancelled&#x60; bookings.
    # @option opts [Date] :check_in_from Check-in on or after, YYYY-MM-DD.
    # @option opts [Date] :check_in_to Check-in on or before, YYYY-MM-DD.
    # @option opts [Integer] :limit Page size. (default to 50)
    # @option opts [Integer] :offset Rows to skip. (default to 0)
    # @return [TiketReservationListResponse]
    def list_tiket_reservations(opts = {})
      data, _status_code, _headers = list_tiket_reservations_with_http_info(opts)
      data
    end

    # List tiket.com reservations as tiket.com sent them
    # tiket.com&#39;s own record of the bookings it delivered, newest first: one row per booked room (&#x60;&lt;id&gt;&#x60;, &#x60;&lt;id&gt;-2&#x60;, …) with tiket.com&#39;s ids, rate plan, meal plan, cancellation policy, what the guest paid, the net amount tiket.com pays the property, how tiket.com pays (&#x60;paymentMethod&#x60;: &#x60;Virtual Credit Card&#x60; or &#x60;Bank Transfer&#x60;), and the Repull reservation the room became.  **Cards.** Card details are never returned by the API, on this route or on &#x60;/v1/reservations&#x60;.  **Date changes.** tiket.com sends a date change as a cancellation plus a new booking. Repull applies it as a change to the original reservation, so the Repull reservation keeps its id; the new tiket.com booking carries &#x60;previousTiketReservationId&#x60;.  The same bookings, normalized like every other channel&#39;s (&#x60;source: tiket&#x60;), are on &#x60;GET /v1/reservations&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :property_id tiket.com Hotel ID (shown next to the property name in the tiket.com extranet; &#x60;propertyId&#x60; on &#x60;GET /v1/channels/tiket/properties&#x60;).
    # @option opts [String] :status Only &#x60;confirmed&#x60; or only &#x60;cancelled&#x60; bookings.
    # @option opts [Date] :check_in_from Check-in on or after, YYYY-MM-DD.
    # @option opts [Date] :check_in_to Check-in on or before, YYYY-MM-DD.
    # @option opts [Integer] :limit Page size. (default to 50)
    # @option opts [Integer] :offset Rows to skip. (default to 0)
    # @return [Array<(TiketReservationListResponse, Integer, Hash)>] TiketReservationListResponse data, response status code and response headers
    def list_tiket_reservations_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.list_tiket_reservations ...'
      end
      allowable_values = ["confirmed", "cancelled"]
      if @api_client.config.client_side_validation && opts[:'status'] && !allowable_values.include?(opts[:'status'])
        fail ArgumentError, "invalid value for \"status\", must be one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 200
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling TiketApi.list_tiket_reservations, must be smaller than or equal to 200.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling TiketApi.list_tiket_reservations, must be greater than or equal to 1.'
      end

      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] < 0
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling TiketApi.list_tiket_reservations, must be greater than or equal to 0.'
      end

      # resource path
      local_var_path = '/v1/channels/tiket/reservations'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'property_id'] = opts[:'property_id'] if !opts[:'property_id'].nil?
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?
      query_params[:'check_in_from'] = opts[:'check_in_from'] if !opts[:'check_in_from'].nil?
      query_params[:'check_in_to'] = opts[:'check_in_to'] if !opts[:'check_in_to'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TiketReservationListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.list_tiket_reservations",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#list_tiket_reservations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Map tiket.com room types to listings
    # Map each room type of a tiket.com property to a Repull listing — the API-key equivalent of the mapping step of the hosted Connect flow, and the counterpart of `POST /v1/channels/booking/listings/map`.  Each mapping is `{ roomTypeCode, listingId }` (`listingId: null` unmaps the room) or `{ roomTypeCode, create: true }`, which creates a new listing from the room with tiket.com's calendar.  Mapping a room to an existing listing sends that listing's calendar to tiket.com, and records any bookings tiket.com delivered while the room was unmapped (`replayedReservations`).  Returns `403 listing_inactive` when a target listing is inactive; nothing is changed.
    # @param tiket_map_listings_request [TiketMapListingsRequest] 
    # @param [Hash] opts the optional parameters
    # @return [TiketMapListingsResponse]
    def map_tiket_listings(tiket_map_listings_request, opts = {})
      data, _status_code, _headers = map_tiket_listings_with_http_info(tiket_map_listings_request, opts)
      data
    end

    # Map tiket.com room types to listings
    # Map each room type of a tiket.com property to a Repull listing — the API-key equivalent of the mapping step of the hosted Connect flow, and the counterpart of &#x60;POST /v1/channels/booking/listings/map&#x60;.  Each mapping is &#x60;{ roomTypeCode, listingId }&#x60; (&#x60;listingId: null&#x60; unmaps the room) or &#x60;{ roomTypeCode, create: true }&#x60;, which creates a new listing from the room with tiket.com&#39;s calendar.  Mapping a room to an existing listing sends that listing&#39;s calendar to tiket.com, and records any bookings tiket.com delivered while the room was unmapped (&#x60;replayedReservations&#x60;).  Returns &#x60;403 listing_inactive&#x60; when a target listing is inactive; nothing is changed.
    # @param tiket_map_listings_request [TiketMapListingsRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TiketMapListingsResponse, Integer, Hash)>] TiketMapListingsResponse data, response status code and response headers
    def map_tiket_listings_with_http_info(tiket_map_listings_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.map_tiket_listings ...'
      end
      # verify the required parameter 'tiket_map_listings_request' is set
      if @api_client.config.client_side_validation && tiket_map_listings_request.nil?
        fail ArgumentError, "Missing the required parameter 'tiket_map_listings_request' when calling TiketApi.map_tiket_listings"
      end
      # resource path
      local_var_path = '/v1/channels/tiket/listings/map'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(tiket_map_listings_request)

      # return_type
      return_type = opts[:debug_return_type] || 'TiketMapListingsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.map_tiket_listings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#map_tiket_listings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Send every mapped listing's calendar to tiket.com
    # Send the full calendar (today to 500 days ahead: rooms to sell, prices, restrictions) of every mapped listing of one tiket.com property, or of every active property when `property_id` is omitted. `refresh_products: true` re-reads room types and rate plans from tiket.com first. Use it after a bulk edit or to re-baseline a property; day-to-day changes are sent automatically.  Inactive listings are not sold, so they are skipped (`skipped: listing_inactive`).
    # @param [Hash] opts the optional parameters
    # @option opts [SyncTiketRequest] :sync_tiket_request 
    # @return [TiketSyncResponse]
    def sync_tiket(opts = {})
      data, _status_code, _headers = sync_tiket_with_http_info(opts)
      data
    end

    # Send every mapped listing&#39;s calendar to tiket.com
    # Send the full calendar (today to 500 days ahead: rooms to sell, prices, restrictions) of every mapped listing of one tiket.com property, or of every active property when &#x60;property_id&#x60; is omitted. &#x60;refresh_products: true&#x60; re-reads room types and rate plans from tiket.com first. Use it after a bulk edit or to re-baseline a property; day-to-day changes are sent automatically.  Inactive listings are not sold, so they are skipped (&#x60;skipped: listing_inactive&#x60;).
    # @param [Hash] opts the optional parameters
    # @option opts [SyncTiketRequest] :sync_tiket_request 
    # @return [Array<(TiketSyncResponse, Integer, Hash)>] TiketSyncResponse data, response status code and response headers
    def sync_tiket_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.sync_tiket ...'
      end
      # resource path
      local_var_path = '/v1/channels/tiket/sync'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'sync_tiket_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'TiketSyncResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.sync_tiket",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#sync_tiket\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Set up a tiket.com property
    # Onboarding and maintenance actions for tiket.com properties (counterpart of `POST /v1/channels/booking/setup`). `action`:  - `request-activation` — ask tiket.com to activate Repull as channel manager for one or more existing properties (`properties[]`). The usual path for a group; a single host activates Repull in the tiket.com extranet and connects through Connect instead. - `check-activation` — whether tiket.com has activated Repull for `hotel_id` yet. - `create-property` — create a new property on tiket.com from a listing (`listing_id` plus the property and company details). Then `request-registration` asks tiket.com for its ids and `set-tiket-hotel-id` records the Hotel ID tiket.com replies with. - `add-room`, `add-rate-plan` — add a room type or rate plan to a property Repull created. - `request-content-mapping` / `confirm-content-mapping` — for an existing property, ask tiket.com to link Repull's codes to it so `POST /v1/listings/{id}/publish/tiket` can send content. - `refresh` — re-read room types and rate plans from tiket.com. - `set-push-rate-plans` — choose the rate plans (`rate_plan_ids`) that receive prices and restrictions. - `set-sync` — turn automatic calendar sending on or off (`enabled`). - `disconnect` — stop syncing the property. Always available, even when its listings are inactive.  tiket.com accepts incomplete content and rejects it later, so content is checked against tiket.com's requirements before it is sent; problems come back as `422 invalid_params` with each field in `value_received`.
    # @param tiket_setup_request [TiketSetupRequest] 
    # @param [Hash] opts the optional parameters
    # @return [TiketSetupResponse]
    def tiket_setup(tiket_setup_request, opts = {})
      data, _status_code, _headers = tiket_setup_with_http_info(tiket_setup_request, opts)
      data
    end

    # Set up a tiket.com property
    # Onboarding and maintenance actions for tiket.com properties (counterpart of &#x60;POST /v1/channels/booking/setup&#x60;). &#x60;action&#x60;:  - &#x60;request-activation&#x60; — ask tiket.com to activate Repull as channel manager for one or more existing properties (&#x60;properties[]&#x60;). The usual path for a group; a single host activates Repull in the tiket.com extranet and connects through Connect instead. - &#x60;check-activation&#x60; — whether tiket.com has activated Repull for &#x60;hotel_id&#x60; yet. - &#x60;create-property&#x60; — create a new property on tiket.com from a listing (&#x60;listing_id&#x60; plus the property and company details). Then &#x60;request-registration&#x60; asks tiket.com for its ids and &#x60;set-tiket-hotel-id&#x60; records the Hotel ID tiket.com replies with. - &#x60;add-room&#x60;, &#x60;add-rate-plan&#x60; — add a room type or rate plan to a property Repull created. - &#x60;request-content-mapping&#x60; / &#x60;confirm-content-mapping&#x60; — for an existing property, ask tiket.com to link Repull&#39;s codes to it so &#x60;POST /v1/listings/{id}/publish/tiket&#x60; can send content. - &#x60;refresh&#x60; — re-read room types and rate plans from tiket.com. - &#x60;set-push-rate-plans&#x60; — choose the rate plans (&#x60;rate_plan_ids&#x60;) that receive prices and restrictions. - &#x60;set-sync&#x60; — turn automatic calendar sending on or off (&#x60;enabled&#x60;). - &#x60;disconnect&#x60; — stop syncing the property. Always available, even when its listings are inactive.  tiket.com accepts incomplete content and rejects it later, so content is checked against tiket.com&#39;s requirements before it is sent; problems come back as &#x60;422 invalid_params&#x60; with each field in &#x60;value_received&#x60;.
    # @param tiket_setup_request [TiketSetupRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TiketSetupResponse, Integer, Hash)>] TiketSetupResponse data, response status code and response headers
    def tiket_setup_with_http_info(tiket_setup_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.tiket_setup ...'
      end
      # verify the required parameter 'tiket_setup_request' is set
      if @api_client.config.client_side_validation && tiket_setup_request.nil?
        fail ArgumentError, "Missing the required parameter 'tiket_setup_request' when calling TiketApi.tiket_setup"
      end
      # resource path
      local_var_path = '/v1/channels/tiket/setup'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(tiket_setup_request)

      # return_type
      return_type = opts[:debug_return_type] || 'TiketSetupResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.tiket_setup",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#tiket_setup\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Write tiket.com rates, availability or restrictions
    # `type` selects the write:  - `availability` — rooms to sell per room type (`availableRooms`). `stopSell` with a `ratePlanCode` also closes that rate plan. - `rates` — `price` on a Room Based property or `occupancyPrices` on an Occupancy Based one, per room type and rate plan. `currency` defaults to the property currency. - `restrictions` — `minStay`, `maxStay`, `stopSell`, `closedToArrival`, `closedToDeparture`, `minAdvanceDays`, `maxAdvanceDays`.  Dates are inclusive and must fall between today and 500 days ahead. Every update is checked before anything is sent; a problem returns `422 invalid_params` naming each field, and nothing is written.  **Children rates are paused.** tiket.com has asked every channel manager not to send children rates until it fixes an issue on its side, so a write that includes `childPrices` is refused with `422 invalid_params` and nothing is sent. Children rates set in the tiket.com extranet still apply. Send `price` or `occupancyPrices` without `childPrices`.  **Every write is read back.** `applied` is `verified` when tiket.com holds what was sent, `mismatch` when it holds something else (see `mismatches`), or `unverified` with `verify: false`. tiket.com's own warnings come back verbatim in `warnings`. A write tiket.com refuses returns `tiket_rejected` with tiket.com's reason and its reference (`echoToken`) in `value_received`.  To write by listing instead of by room type, use `PUT /v1/channels/tiket/listings/{id}/pricing`.
    # @param tiket_availability_update_request [TiketAvailabilityUpdateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [TiketAriWriteResponse]
    def update_tiket_availability(tiket_availability_update_request, opts = {})
      data, _status_code, _headers = update_tiket_availability_with_http_info(tiket_availability_update_request, opts)
      data
    end

    # Write tiket.com rates, availability or restrictions
    # &#x60;type&#x60; selects the write:  - &#x60;availability&#x60; — rooms to sell per room type (&#x60;availableRooms&#x60;). &#x60;stopSell&#x60; with a &#x60;ratePlanCode&#x60; also closes that rate plan. - &#x60;rates&#x60; — &#x60;price&#x60; on a Room Based property or &#x60;occupancyPrices&#x60; on an Occupancy Based one, per room type and rate plan. &#x60;currency&#x60; defaults to the property currency. - &#x60;restrictions&#x60; — &#x60;minStay&#x60;, &#x60;maxStay&#x60;, &#x60;stopSell&#x60;, &#x60;closedToArrival&#x60;, &#x60;closedToDeparture&#x60;, &#x60;minAdvanceDays&#x60;, &#x60;maxAdvanceDays&#x60;.  Dates are inclusive and must fall between today and 500 days ahead. Every update is checked before anything is sent; a problem returns &#x60;422 invalid_params&#x60; naming each field, and nothing is written.  **Children rates are paused.** tiket.com has asked every channel manager not to send children rates until it fixes an issue on its side, so a write that includes &#x60;childPrices&#x60; is refused with &#x60;422 invalid_params&#x60; and nothing is sent. Children rates set in the tiket.com extranet still apply. Send &#x60;price&#x60; or &#x60;occupancyPrices&#x60; without &#x60;childPrices&#x60;.  **Every write is read back.** &#x60;applied&#x60; is &#x60;verified&#x60; when tiket.com holds what was sent, &#x60;mismatch&#x60; when it holds something else (see &#x60;mismatches&#x60;), or &#x60;unverified&#x60; with &#x60;verify: false&#x60;. tiket.com&#39;s own warnings come back verbatim in &#x60;warnings&#x60;. A write tiket.com refuses returns &#x60;tiket_rejected&#x60; with tiket.com&#39;s reason and its reference (&#x60;echoToken&#x60;) in &#x60;value_received&#x60;.  To write by listing instead of by room type, use &#x60;PUT /v1/channels/tiket/listings/{id}/pricing&#x60;.
    # @param tiket_availability_update_request [TiketAvailabilityUpdateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TiketAriWriteResponse, Integer, Hash)>] TiketAriWriteResponse data, response status code and response headers
    def update_tiket_availability_with_http_info(tiket_availability_update_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.update_tiket_availability ...'
      end
      # verify the required parameter 'tiket_availability_update_request' is set
      if @api_client.config.client_side_validation && tiket_availability_update_request.nil?
        fail ArgumentError, "Missing the required parameter 'tiket_availability_update_request' when calling TiketApi.update_tiket_availability"
      end
      # resource path
      local_var_path = '/v1/channels/tiket/availability'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(tiket_availability_update_request)

      # return_type
      return_type = opts[:debug_return_type] || 'TiketAriWriteResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.update_tiket_availability",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#update_tiket_availability\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Write tiket.com rates, availability or restrictions for a listing
    # Same contract as `PUT /v1/channels/tiket/availability`, addressed by listing. `roomTypeCode` is always the listing's room; `ratePlanCode` defaults to every rate plan of the room selected for pushes (`pushTarget`), so one update row is sent to each. `type` defaults to `rates`.  **Children rates are paused.** tiket.com has asked every channel manager not to send children rates until it fixes an issue on its side, so a write that includes `childPrices` is refused with `422 invalid_params` and nothing is sent. Children rates set in the tiket.com extranet still apply. Send `price` or `occupancyPrices` without `childPrices`.
    # @param id [Integer] Repull listing id.
    # @param tiket_listing_pricing_update_request [TiketListingPricingUpdateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [TiketAriWriteResponse]
    def update_tiket_listing_pricing(id, tiket_listing_pricing_update_request, opts = {})
      data, _status_code, _headers = update_tiket_listing_pricing_with_http_info(id, tiket_listing_pricing_update_request, opts)
      data
    end

    # Write tiket.com rates, availability or restrictions for a listing
    # Same contract as &#x60;PUT /v1/channels/tiket/availability&#x60;, addressed by listing. &#x60;roomTypeCode&#x60; is always the listing&#39;s room; &#x60;ratePlanCode&#x60; defaults to every rate plan of the room selected for pushes (&#x60;pushTarget&#x60;), so one update row is sent to each. &#x60;type&#x60; defaults to &#x60;rates&#x60;.  **Children rates are paused.** tiket.com has asked every channel manager not to send children rates until it fixes an issue on its side, so a write that includes &#x60;childPrices&#x60; is refused with &#x60;422 invalid_params&#x60; and nothing is sent. Children rates set in the tiket.com extranet still apply. Send &#x60;price&#x60; or &#x60;occupancyPrices&#x60; without &#x60;childPrices&#x60;.
    # @param id [Integer] Repull listing id.
    # @param tiket_listing_pricing_update_request [TiketListingPricingUpdateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TiketAriWriteResponse, Integer, Hash)>] TiketAriWriteResponse data, response status code and response headers
    def update_tiket_listing_pricing_with_http_info(id, tiket_listing_pricing_update_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TiketApi.update_tiket_listing_pricing ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TiketApi.update_tiket_listing_pricing"
      end
      # verify the required parameter 'tiket_listing_pricing_update_request' is set
      if @api_client.config.client_side_validation && tiket_listing_pricing_update_request.nil?
        fail ArgumentError, "Missing the required parameter 'tiket_listing_pricing_update_request' when calling TiketApi.update_tiket_listing_pricing"
      end
      # resource path
      local_var_path = '/v1/channels/tiket/listings/{id}/pricing'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(tiket_listing_pricing_update_request)

      # return_type
      return_type = opts[:debug_return_type] || 'TiketAriWriteResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"TiketApi.update_tiket_listing_pricing",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TiketApi#update_tiket_listing_pricing\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
