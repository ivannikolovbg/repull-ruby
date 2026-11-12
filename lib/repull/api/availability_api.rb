=begin
#Repull API

#The unified API for vacation rental tech. Connect Airbnb, Booking.com, Vrbo and more channels, plus 14 PMS platforms, through one REST API.  ## Designed for AI agents Every error response on this API includes machine-parseable fields so an LLM (Claude in MCP, Cursor, Cline, GPT, etc.) can self-recover without escalating to a human: - `error.code` — stable string identifier (e.g. `invalid_params`, `rate_limit_exceeded`) - `error.message` — human-readable cause - `error.fix` — exact recovery steps (e.g. \"Pass `check_in_after` as ISO 8601: `?check_in_after=2026-01-15`\") - `error.docs_url` — link to the canonical write-up at `https://repull.dev/docs/errors/{code}` - `error.request_id` — id to correlate with server-side logs - `error.field` / `error.value_received` / `error.valid_values` / `error.did_you_mean` — when the error is parameter-specific - `error.retry_after` — seconds to wait before retrying (rate-limit + transient upstream)  `Access-Control-Expose-Headers` lists `x-request-id` and the `X-RateLimit-*` family so browsers can read them on cross-origin responses.  ## Quick Start 1. Get an API key at https://repull.dev/dashboard 2. Connect a PMS: `POST /v1/connect/{provider}` 3. List properties: `GET /v1/properties` 4. Get reservations: `GET /v1/reservations`  ## Authentication All requests require a Bearer token: ``` Authorization: Bearer sk_live_YOUR_API_KEY ```  ## Request Correlation (X-Request-ID) Every response carries an `X-Request-ID` header, e.g. `X-Request-ID: req_01HXY...`. Include this id in support tickets and bug reports — we can trace the full request lifecycle (auth, rate limit, handler, downstream calls, log row) from a single id.  You may set the header on the inbound request to forward your own trace id; we will echo it back instead of generating a new one. Accepted format: `^[\\\\w.-]{1,128}$`.  The id is also embedded in error envelopes as `request_id` so server-side log diffs work even when the response headers are stripped by an intermediate proxy.  ## Rate Limits The public API enforces a per-API-key sliding-window rate limit on top of the per-tier monthly + daily-AI quotas.  **Default policy:** 600 requests per 60 seconds, per API key. Sliding window — there is no fixed-minute boundary you can burst across.  Every response includes:  | Header | Meaning | |---|---| | `X-RateLimit-Limit` | Requests permitted in the current window. | | `X-RateLimit-Remaining` | Requests left in the current window after this call. | | `X-RateLimit-Reset` | Unix epoch (seconds) when the next slot opens. | | `X-RateLimit-Policy` | Machine-readable policy descriptor, e.g. `600;w=60`. | | `Retry-After` | Seconds to wait before retrying. **Only present on 429 responses.** |  **On 429 (rate_limit_exceeded):** the response body matches the standard error envelope with `code: \"rate_limit_exceeded\"`, plus `limit`, `window_seconds`, `retry_after`, and `request_id` fields. SDKs MUST honor `Retry-After` and use exponential backoff with jitter on subsequent retries — never a tight loop.  Recommended backoff: ``` sleep_ms = (Retry-After * 1000) + random(0..250) ```  Monthly + daily-AI tier quotas (`free`, `starter`, `custom`) are enforced separately and also surface as 429s; they include `tier`, `scope`, `limit`, `used` and `resets_at` fields.  **The way past a request quota.** The monthly quota refusal (`429 rate_limit_exceeded` with `scope: \"monthly\"`), `402 credits_exhausted` and `429 daily_limit_exceeded` also carry `upgrade` (the cheapest plan that covers your usage: its exact monthly price for your listings, its request quotas and a `checkout_url` that opens checkout for that price; `plan: \"custom\"` with a `contact_email` when no self-serve plan covers it), `credits` (pay-as-you-go: `usd_per_1000_requests`, `top_up_url`, your `balance_usd`), `resets_at` and `projected_monthly_requests`. The per-minute 429 (`scope: \"per_api_key\"`) carries none of these: wait `Retry-After`.  ## Plan listing limits Each plan includes a number of **active listings**:  | Tier | Active listings | |---|---| | `free` | 3 | | `starter` | no cap: 10 included, then billed per listing | | `custom` | no cap |  Going over the plan never blocks your API calls. Listings beyond the plan are **held back**: they stay connected and keep syncing, but they are not served. A held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`, and collection routes leave it out. Every JSON response then carries a `planNotice` and the `X-Repull-Listings-Held-Back` header, so you know there is more to see.  Choose which listings are active with `POST /v1/listings/status`. Upgrading at `https://repull.dev/dashboard/billing` lifts the cap but does not switch held-back listings on: you choose which to activate afterwards, with the same call or from the dashboard, and each one you switch on is billed from then.  Only a call that would itself take you over the plan is refused, with **`402 listings_limit_exceeded`**: activating listings (`PATCH /v1/listings/{id}` with `{ \"active\": true }`, `POST /v1/listings/status`) or creating one (`POST /v1/listings`). Nothing else changes. The envelope carries the tier, the limit, the active count and an upgrade link next to the standard `code` / `message` / `fix` / `docs_url` / `request_id`.  If an account has more active listings than its plan (for example after a downgrade), calls are still served and `planNotice` says so (code \"listings_over_plan\").

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.22.0

=end

require 'cgi'

module Repull
  class AvailabilityApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Update availability across many properties
    # Applies ONE settings object across up to 500 properties and pushes the result to every connected channel.  Ownership is checked before anything is written: a batch containing a property from another workspace is refused as a whole and names the offending ids, rather than being partially applied.  Per-property *different* values are separate calls — presenting them as one request would be a false claim about atomicity.  Returns `403 listing_inactive` naming every inactive listing when any listing in the request is inactive; nothing is written.
    # @param availability_batch_write_request [AvailabilityBatchWriteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [AvailabilityWriteResult]
    def batch_update_availability(availability_batch_write_request, opts = {})
      data, _status_code, _headers = batch_update_availability_with_http_info(availability_batch_write_request, opts)
      data
    end

    # Update availability across many properties
    # Applies ONE settings object across up to 500 properties and pushes the result to every connected channel.  Ownership is checked before anything is written: a batch containing a property from another workspace is refused as a whole and names the offending ids, rather than being partially applied.  Per-property *different* values are separate calls — presenting them as one request would be a false claim about atomicity.  Returns &#x60;403 listing_inactive&#x60; naming every inactive listing when any listing in the request is inactive; nothing is written.
    # @param availability_batch_write_request [AvailabilityBatchWriteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(AvailabilityWriteResult, Integer, Hash)>] AvailabilityWriteResult data, response status code and response headers
    def batch_update_availability_with_http_info(availability_batch_write_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AvailabilityApi.batch_update_availability ...'
      end
      # verify the required parameter 'availability_batch_write_request' is set
      if @api_client.config.client_side_validation && availability_batch_write_request.nil?
        fail ArgumentError, "Missing the required parameter 'availability_batch_write_request' when calling AvailabilityApi.batch_update_availability"
      end
      # resource path
      local_var_path = '/v1/availability/batch'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(availability_batch_write_request)

      # return_type
      return_type = opts[:debug_return_type] || 'AvailabilityWriteResult'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"AvailabilityApi.batch_update_availability",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AvailabilityApi#batch_update_availability\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get property availability
    # Channel-agnostic day-by-day availability calendar for a property over a date window. Returns a thin per-date shape — `{ date, available, price, minNights, availableUnits }` — projected from the property calendar. `availableUnits` is 1 or 0 for a single home, and the units left for a listing with units (a Mews or Cloudbeds room type, a Guesty multi-unit listing). On such a listing each day also carries `units: [{ id, available }]` — which unit is free that night, with the ids of the listing's `units[]` and a reservation's `unit`.  The `from` and `to` query params are **required** (ISO `YYYY-MM-DD`, inclusive) — omitting or malforming either returns 422. The window is capped at 366 days; longer ranges are truncated to the first 366 days.  **`days` contains only the dates we actually hold calendar data for.** Requested dates with no calendar row are listed in `coverage.missingDates` — their availability is unknown. Never treat a missing date as bookable: this endpoint deliberately does not synthesise availability, because a fabricated open date can be double-booked. A property with no calendar still returns a real 200 (`days: []`, every date in `coverage.missingDates`), never a 404 — 404 means the property id does not exist or belongs to a different workspace.  This endpoint is read-only, and the projected per-date shape carries **availability, units left, price, and min-nights only** — it does NOT expose max-stay, closed-to-arrival (CTA), closed-to-departure (CTD), or the dedicated stop-sell flag. To read or write that full restriction set on Booking.com use the channel routes: `GET`/`PUT /v1/channels/booking/availability` (with the room + rate ids from `GET /v1/channels/booking/properties/{id}/rooms`). To **write** calendar values use `PUT /v1/availability/{propertyId}` (or `PATCH /v1/availability/batch`), which updates the property calendar and pushes to its connected channels; channel-only settings stay on the channel routes.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.
    # @param property_id [Integer] Repull property id (equal to &#x60;listings.id&#x60;; the same integer used as &#x60;propertyId&#x60; on availability and &#x60;listingId&#x60; on reservations).
    # @param from [Date] Start of the window (inclusive), ISO &#x60;YYYY-MM-DD&#x60;. Required — missing/malformed returns 422. &#x60;startDate&#x60; is accepted as an alias.
    # @param to [Date] End of the window (inclusive), ISO &#x60;YYYY-MM-DD&#x60;. Required — missing/malformed returns 422. &#x60;endDate&#x60; is accepted as an alias.
    # @param [Hash] opts the optional parameters
    # @return [PropertyAvailability]
    def get_availability(property_id, from, to, opts = {})
      data, _status_code, _headers = get_availability_with_http_info(property_id, from, to, opts)
      data
    end

    # Get property availability
    # Channel-agnostic day-by-day availability calendar for a property over a date window. Returns a thin per-date shape — &#x60;{ date, available, price, minNights, availableUnits }&#x60; — projected from the property calendar. &#x60;availableUnits&#x60; is 1 or 0 for a single home, and the units left for a listing with units (a Mews or Cloudbeds room type, a Guesty multi-unit listing). On such a listing each day also carries &#x60;units: [{ id, available }]&#x60; — which unit is free that night, with the ids of the listing&#39;s &#x60;units[]&#x60; and a reservation&#39;s &#x60;unit&#x60;.  The &#x60;from&#x60; and &#x60;to&#x60; query params are **required** (ISO &#x60;YYYY-MM-DD&#x60;, inclusive) — omitting or malforming either returns 422. The window is capped at 366 days; longer ranges are truncated to the first 366 days.  **&#x60;days&#x60; contains only the dates we actually hold calendar data for.** Requested dates with no calendar row are listed in &#x60;coverage.missingDates&#x60; — their availability is unknown. Never treat a missing date as bookable: this endpoint deliberately does not synthesise availability, because a fabricated open date can be double-booked. A property with no calendar still returns a real 200 (&#x60;days: []&#x60;, every date in &#x60;coverage.missingDates&#x60;), never a 404 — 404 means the property id does not exist or belongs to a different workspace.  This endpoint is read-only, and the projected per-date shape carries **availability, units left, price, and min-nights only** — it does NOT expose max-stay, closed-to-arrival (CTA), closed-to-departure (CTD), or the dedicated stop-sell flag. To read or write that full restriction set on Booking.com use the channel routes: &#x60;GET&#x60;/&#x60;PUT /v1/channels/booking/availability&#x60; (with the room + rate ids from &#x60;GET /v1/channels/booking/properties/{id}/rooms&#x60;). To **write** calendar values use &#x60;PUT /v1/availability/{propertyId}&#x60; (or &#x60;PATCH /v1/availability/batch&#x60;), which updates the property calendar and pushes to its connected channels; channel-only settings stay on the channel routes.  Returns &#x60;403 listing_inactive&#x60; when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.
    # @param property_id [Integer] Repull property id (equal to &#x60;listings.id&#x60;; the same integer used as &#x60;propertyId&#x60; on availability and &#x60;listingId&#x60; on reservations).
    # @param from [Date] Start of the window (inclusive), ISO &#x60;YYYY-MM-DD&#x60;. Required — missing/malformed returns 422. &#x60;startDate&#x60; is accepted as an alias.
    # @param to [Date] End of the window (inclusive), ISO &#x60;YYYY-MM-DD&#x60;. Required — missing/malformed returns 422. &#x60;endDate&#x60; is accepted as an alias.
    # @param [Hash] opts the optional parameters
    # @return [Array<(PropertyAvailability, Integer, Hash)>] PropertyAvailability data, response status code and response headers
    def get_availability_with_http_info(property_id, from, to, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AvailabilityApi.get_availability ...'
      end
      # verify the required parameter 'property_id' is set
      if @api_client.config.client_side_validation && property_id.nil?
        fail ArgumentError, "Missing the required parameter 'property_id' when calling AvailabilityApi.get_availability"
      end
      # verify the required parameter 'from' is set
      if @api_client.config.client_side_validation && from.nil?
        fail ArgumentError, "Missing the required parameter 'from' when calling AvailabilityApi.get_availability"
      end
      # verify the required parameter 'to' is set
      if @api_client.config.client_side_validation && to.nil?
        fail ArgumentError, "Missing the required parameter 'to' when calling AvailabilityApi.get_availability"
      end
      # resource path
      local_var_path = '/v1/availability/{propertyId}'.sub('{propertyId}', CGI.escape(property_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'from'] = from
      query_params[:'to'] = to

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PropertyAvailability'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"AvailabilityApi.get_availability",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AvailabilityApi#get_availability\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Set prices, block or unblock dates
    # Writes the calendar for one property AND pushes to every connected channel in the same step. A write that only changed our copy would leave the OTA calendars stale and eventually double-book a guest.  Returns `403 listing_inactive` when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.
    # @param property_id [Integer] 
    # @param availability_write_request [AvailabilityWriteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [AvailabilityWriteResult]
    def update_availability(property_id, availability_write_request, opts = {})
      data, _status_code, _headers = update_availability_with_http_info(property_id, availability_write_request, opts)
      data
    end

    # Set prices, block or unblock dates
    # Writes the calendar for one property AND pushes to every connected channel in the same step. A write that only changed our copy would leave the OTA calendars stale and eventually double-book a guest.  Returns &#x60;403 listing_inactive&#x60; when the listing is inactive. An inactive listing keeps syncing, but cannot be read or changed through the API until it is activated.
    # @param property_id [Integer] 
    # @param availability_write_request [AvailabilityWriteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(AvailabilityWriteResult, Integer, Hash)>] AvailabilityWriteResult data, response status code and response headers
    def update_availability_with_http_info(property_id, availability_write_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AvailabilityApi.update_availability ...'
      end
      # verify the required parameter 'property_id' is set
      if @api_client.config.client_side_validation && property_id.nil?
        fail ArgumentError, "Missing the required parameter 'property_id' when calling AvailabilityApi.update_availability"
      end
      # verify the required parameter 'availability_write_request' is set
      if @api_client.config.client_side_validation && availability_write_request.nil?
        fail ArgumentError, "Missing the required parameter 'availability_write_request' when calling AvailabilityApi.update_availability"
      end
      # resource path
      local_var_path = '/v1/availability/{propertyId}'.sub('{propertyId}', CGI.escape(property_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(availability_write_request)

      # return_type
      return_type = opts[:debug_return_type] || 'AvailabilityWriteResult'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"AvailabilityApi.update_availability",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AvailabilityApi#update_availability\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
