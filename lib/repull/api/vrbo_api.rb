=begin
#Repull API

#The unified API for vacation rental tech. Connect Airbnb, Booking.com, Vrbo and more channels, plus 14 PMS platforms, through one REST API.  ## Designed for AI agents Every error response on this API includes machine-parseable fields so an LLM (Claude in MCP, Cursor, Cline, GPT, etc.) can self-recover without escalating to a human: - `error.code` — stable string identifier (e.g. `invalid_params`, `rate_limit_exceeded`) - `error.message` — human-readable cause - `error.fix` — exact recovery steps (e.g. \"Pass `check_in_after` as ISO 8601: `?check_in_after=2026-01-15`\") - `error.docs_url` — link to the canonical write-up at `https://repull.dev/docs/errors/{code}` - `error.request_id` — id to correlate with server-side logs - `error.field` / `error.value_received` / `error.valid_values` / `error.did_you_mean` — when the error is parameter-specific - `error.retry_after` — seconds to wait before retrying (rate-limit + transient upstream)  `Access-Control-Expose-Headers` lists `x-request-id` and the `X-RateLimit-*` family so browsers can read them on cross-origin responses.  ## Quick Start 1. Get an API key at https://repull.dev/dashboard 2. Connect a PMS: `POST /v1/connect/{provider}` 3. List properties: `GET /v1/properties` 4. Get reservations: `GET /v1/reservations`  ## Authentication All requests require a Bearer token: ``` Authorization: Bearer sk_live_YOUR_API_KEY ```  ## Request Correlation (X-Request-ID) Every response carries an `X-Request-ID` header, e.g. `X-Request-ID: req_01HXY...`. Include this id in support tickets and bug reports — we can trace the full request lifecycle (auth, rate limit, handler, downstream calls, log row) from a single id.  You may set the header on the inbound request to forward your own trace id; we will echo it back instead of generating a new one. Accepted format: `^[\\\\w.-]{1,128}$`.  The id is also embedded in error envelopes as `request_id` so server-side log diffs work even when the response headers are stripped by an intermediate proxy.  ## Rate Limits The public API enforces a per-API-key sliding-window rate limit on top of the per-tier monthly + daily-AI quotas.  **Default policy:** 600 requests per 60 seconds, per API key. Sliding window — there is no fixed-minute boundary you can burst across.  Every response includes:  | Header | Meaning | |---|---| | `X-RateLimit-Limit` | Requests permitted in the current window. | | `X-RateLimit-Remaining` | Requests left in the current window after this call. | | `X-RateLimit-Reset` | Unix epoch (seconds) when the next slot opens. | | `X-RateLimit-Policy` | Machine-readable policy descriptor, e.g. `600;w=60`. | | `Retry-After` | Seconds to wait before retrying. **Only present on 429 responses.** |  **On 429 (rate_limit_exceeded):** the response body matches the standard error envelope with `code: \"rate_limit_exceeded\"`, plus `limit`, `window_seconds`, `retry_after`, and `request_id` fields. SDKs MUST honor `Retry-After` and use exponential backoff with jitter on subsequent retries — never a tight loop.  Recommended backoff: ``` sleep_ms = (Retry-After * 1000) + random(0..250) ```  Monthly + daily-AI tier quotas (`free`, `starter`, `custom`) are enforced separately and also surface as 429s; they include `tier`, `scope`, `limit`, `used` and `resets_at` fields.  **The way past a request quota.** The monthly quota refusal (`429 rate_limit_exceeded` with `scope: \"monthly\"`), `402 credits_exhausted` and `429 daily_limit_exceeded` also carry `upgrade` (the cheapest plan that covers your usage: its exact monthly price for your listings, its request quotas and a `checkout_url` that opens checkout for that price; `plan: \"custom\"` with a `contact_email` when no self-serve plan covers it), `credits` (pay-as-you-go: `usd_per_1000_requests`, `top_up_url`, your `balance_usd`), `resets_at` and `projected_monthly_requests`. The per-minute 429 (`scope: \"per_api_key\"`) carries none of these: wait `Retry-After`.  ## Plan listing limits Each plan includes a number of **active listings**:  | Tier | Active listings | |---|---| | `free` | 3 | | `starter` | no cap: 10 included, then billed per listing | | `custom` | no cap |  Going over the plan never blocks your API calls. Listings beyond the plan are **held back**: they stay connected and keep syncing, but they are not served. A held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`, and collection routes leave it out. Every JSON response then carries a `planNotice` and the `X-Repull-Listings-Held-Back` header, so you know there is more to see.  Choose which listings are active with `POST /v1/listings/status`. Upgrading at `https://repull.dev/dashboard/billing` lifts the cap but does not switch held-back listings on: you choose which to activate afterwards, with the same call or from the dashboard, and each one you switch on is billed from then.  Only a call that would itself take you over the plan is refused, with **`402 listings_limit_exceeded`**: activating listings (`PATCH /v1/listings/{id}` with `{ \"active\": true }`, `POST /v1/listings/status`) or creating one (`POST /v1/listings`). Nothing else changes. The envelope carries the tier, the limit, the active count and an upgrade link next to the standard `code` / `message` / `fix` / `docs_url` / `request_id`.  If an account has more active listings than its plan (for example after a downgrade), calls are still served and `planNotice` says so (code \"listings_over_plan\").  ## Failed payments If your plan's renewal payment fails, nothing is blocked: your API calls keep working while Stripe retries the card. Every successful JSON response then carries a `billingNotice` (code `payment_failed`) with the amount, when it failed, the next automatic retry (`nextRetryAt`) and `payUrl`, the invoice to pay. It disappears once the invoice is paid.

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.22.0

=end

require 'cgi'

module Repull
  class VRBOApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Add a video to the Vrbo listing
    # Add one video to the listing's existing Vrbo listing from an https URL. POST `{url}`: an https URL of an MP4, MOV, WEBM, AVI or QT file (Vrbo takes up to 5 GB; we take up to 2 GB). The file is downloaded and uploaded to Vrbo, which then processes and reviews it. DELETE `?videoId=` removes videos.  **Cost:** the file is downloaded and uploaded to Vrbo inside the request — allow several minutes for a large file. The answer lists the videos as Vrbo has them; a new one shows Vrbo's processing status, and `rejectedReasons` once its review refuses it. Each call adds a video, so a retry after a timeout should read the videos first.  Needs full access (`403 vrbo_messaging_access` otherwise).
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param add_vrbo_listing_video_request [AddVrboListingVideoRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [AddVrboListingVideo200Response]
    def add_vrbo_listing_video(id, add_vrbo_listing_video_request, opts = {})
      data, _status_code, _headers = add_vrbo_listing_video_with_http_info(id, add_vrbo_listing_video_request, opts)
      data
    end

    # Add a video to the Vrbo listing
    # Add one video to the listing&#39;s existing Vrbo listing from an https URL. POST &#x60;{url}&#x60;: an https URL of an MP4, MOV, WEBM, AVI or QT file (Vrbo takes up to 5 GB; we take up to 2 GB). The file is downloaded and uploaded to Vrbo, which then processes and reviews it. DELETE &#x60;?videoId&#x3D;&#x60; removes videos.  **Cost:** the file is downloaded and uploaded to Vrbo inside the request — allow several minutes for a large file. The answer lists the videos as Vrbo has them; a new one shows Vrbo&#39;s processing status, and &#x60;rejectedReasons&#x60; once its review refuses it. Each call adds a video, so a retry after a timeout should read the videos first.  Needs full access (&#x60;403 vrbo_messaging_access&#x60; otherwise).
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param add_vrbo_listing_video_request [AddVrboListingVideoRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(AddVrboListingVideo200Response, Integer, Hash)>] AddVrboListingVideo200Response data, response status code and response headers
    def add_vrbo_listing_video_with_http_info(id, add_vrbo_listing_video_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.add_vrbo_listing_video ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.add_vrbo_listing_video"
      end
      # verify the required parameter 'add_vrbo_listing_video_request' is set
      if @api_client.config.client_side_validation && add_vrbo_listing_video_request.nil?
        fail ArgumentError, "Missing the required parameter 'add_vrbo_listing_video_request' when calling VRBOApi.add_vrbo_listing_video"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/videos'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(add_vrbo_listing_video_request)

      # return_type
      return_type = opts[:debug_return_type] || 'AddVrboListingVideo200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.add_vrbo_listing_video",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#add_vrbo_listing_video\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Remove videos from the Vrbo listing
    # Remove videos from the listing's existing Vrbo listing by their `id` (from `GET …/videos`). The answer lists the videos Vrbo has left.  Needs full access (`403 vrbo_messaging_access` otherwise).
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param video_id [String] The &#x60;id&#x60; of the video to remove (comma-separated for several).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [AddVrboListingVideo200Response]
    def delete_vrbo_listing_videos(id, video_id, opts = {})
      data, _status_code, _headers = delete_vrbo_listing_videos_with_http_info(id, video_id, opts)
      data
    end

    # Remove videos from the Vrbo listing
    # Remove videos from the listing&#39;s existing Vrbo listing by their &#x60;id&#x60; (from &#x60;GET …/videos&#x60;). The answer lists the videos Vrbo has left.  Needs full access (&#x60;403 vrbo_messaging_access&#x60; otherwise).
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param video_id [String] The &#x60;id&#x60; of the video to remove (comma-separated for several).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(AddVrboListingVideo200Response, Integer, Hash)>] AddVrboListingVideo200Response data, response status code and response headers
    def delete_vrbo_listing_videos_with_http_info(id, video_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.delete_vrbo_listing_videos ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.delete_vrbo_listing_videos"
      end
      # verify the required parameter 'video_id' is set
      if @api_client.config.client_side_validation && video_id.nil?
        fail ArgumentError, "Missing the required parameter 'video_id' when calling VRBOApi.delete_vrbo_listing_videos"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/videos'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'videoId'] = video_id
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'AddVrboListingVideo200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.delete_vrbo_listing_videos",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#delete_vrbo_listing_videos\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo additional details
    # The free-text additional details for the property, its bedrooms and its bathrooms.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingAdditionalInfo200Response]
    def get_vrbo_listing_additional_info(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_additional_info_with_http_info(id, opts)
      data
    end

    # Get the Vrbo additional details
    # The free-text additional details for the property, its bedrooms and its bathrooms.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingAdditionalInfo200Response, Integer, Hash)>] GetVrboListingAdditionalInfo200Response data, response status code and response headers
    def get_vrbo_listing_additional_info_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_additional_info ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_additional_info"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/additional-info'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingAdditionalInfo200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_additional_info",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_additional_info\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo amenities
    # Vrbo's 19 amenity groups (~440 fields) — each field with its id, type (checkbox, choice, text, number, measurement, checkboxGroup), current value, options and the parent it is shown under (`shownWhen`). Includes location & view, nearby attractions and check-out instructions.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call per group (19 in all; narrow with `?groups=`) on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :groups Amenity groups to read, comma-separated (default: all 19 — one Vrbo call each): essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions.
    # @return [GetVrboListingAmenities200Response]
    def get_vrbo_listing_amenities(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_amenities_with_http_info(id, opts)
      data
    end

    # Get the Vrbo amenities
    # Vrbo&#39;s 19 amenity groups (~440 fields) — each field with its id, type (checkbox, choice, text, number, measurement, checkboxGroup), current value, options and the parent it is shown under (&#x60;shownWhen&#x60;). Includes location &amp; view, nearby attractions and check-out instructions.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call per group (19 in all; narrow with &#x60;?groups&#x3D;&#x60;) on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :groups Amenity groups to read, comma-separated (default: all 19 — one Vrbo call each): essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions.
    # @return [Array<(GetVrboListingAmenities200Response, Integer, Hash)>] GetVrboListingAmenities200Response data, response status code and response headers
    def get_vrbo_listing_amenities_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_amenities ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_amenities"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/amenities'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'groups'] = opts[:'groups'] if !opts[:'groups'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingAmenities200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_amenities",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_amenities\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo booking settings
    # Instant book or quote-and-hold, minimum nights, notice before arrival, how far ahead guests can book, maximum stay, access type.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingBookingSettings200Response]
    def get_vrbo_listing_booking_settings(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_booking_settings_with_http_info(id, opts)
      data
    end

    # Get the Vrbo booking settings
    # Instant book or quote-and-hold, minimum nights, notice before arrival, how far ahead guests can book, maximum stay, access type.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingBookingSettings200Response, Integer, Hash)>] GetVrboListingBookingSettings200Response data, response status code and response headers
    def get_vrbo_listing_booking_settings_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_booking_settings ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_booking_settings"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/booking-settings'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingBookingSettings200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_booking_settings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_booking_settings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo cancellation policy
    # The policy (Vrbo's named ones or custom refund windows), seasonal overrides, and the named policies Vrbo offers.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingCancellation200Response]
    def get_vrbo_listing_cancellation(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_cancellation_with_http_info(id, opts)
      data
    end

    # Get the Vrbo cancellation policy
    # The policy (Vrbo&#39;s named ones or custom refund windows), seasonal overrides, and the named policies Vrbo offers.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingCancellation200Response, Integer, Hash)>] GetVrboListingCancellation200Response data, response status code and response headers
    def get_vrbo_listing_cancellation_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_cancellation ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_cancellation"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/cancellation'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingCancellation200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_cancellation",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_cancellation\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get several Vrbo listing sections
    # Read several sections of the listing's Vrbo listing in one call. `sections` is required: name them (`?sections=description,house-rules,fees`) or ask for `all`.  **Cost:** each section is read live on Vrbo, with calls spaced ~3 s apart per account — `all` is about 45 Vrbo calls, **around 2.5 minutes**. Prefer the one-section endpoints (`GET /v1/channels/vrbo/listings/{id}/{section}`) and never poll this one. A section that fails carries `{ error: { code, message } }`; the others still answer.  Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param sections [String] Comma-separated sections, or &#x60;all&#x60;: description, property, story, additional-info, translations, photos, amenities, rooms, location, house-rules, booking-settings, cancellation, fees, pricing, rates, payment-terms, protection, taxes, registration, welcome-guide, videos.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingContent200Response]
    def get_vrbo_listing_content(id, sections, opts = {})
      data, _status_code, _headers = get_vrbo_listing_content_with_http_info(id, sections, opts)
      data
    end

    # Get several Vrbo listing sections
    # Read several sections of the listing&#39;s Vrbo listing in one call. &#x60;sections&#x60; is required: name them (&#x60;?sections&#x3D;description,house-rules,fees&#x60;) or ask for &#x60;all&#x60;.  **Cost:** each section is read live on Vrbo, with calls spaced ~3 s apart per account — &#x60;all&#x60; is about 45 Vrbo calls, **around 2.5 minutes**. Prefer the one-section endpoints (&#x60;GET /v1/channels/vrbo/listings/{id}/{section}&#x60;) and never poll this one. A section that fails carries &#x60;{ error: { code, message } }&#x60;; the others still answer.  Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param sections [String] Comma-separated sections, or &#x60;all&#x60;: description, property, story, additional-info, translations, photos, amenities, rooms, location, house-rules, booking-settings, cancellation, fees, pricing, rates, payment-terms, protection, taxes, registration, welcome-guide, videos.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingContent200Response, Integer, Hash)>] GetVrboListingContent200Response data, response status code and response headers
    def get_vrbo_listing_content_with_http_info(id, sections, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_content ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_content"
      end
      # verify the required parameter 'sections' is set
      if @api_client.config.client_side_validation && sections.nil?
        fail ArgumentError, "Missing the required parameter 'sections' when calling VRBOApi.get_vrbo_listing_content"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/content'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'sections'] = sections
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingContent200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_content",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_content\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo headline and description
    # The headline (10–80 characters) and the description guests read.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingDescription200Response]
    def get_vrbo_listing_description(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_description_with_http_info(id, opts)
      data
    end

    # Get the Vrbo headline and description
    # The headline (10–80 characters) and the description guests read.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingDescription200Response, Integer, Hash)>] GetVrboListingDescription200Response data, response status code and response headers
    def get_vrbo_listing_description_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_description ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_description"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/description'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingDescription200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_description",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_description\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo fees
    # Cleaning, pet and extra-guest fees and custom fees, with their type (per stay / per night) and whether they are taxable.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingFees200Response]
    def get_vrbo_listing_fees(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_fees_with_http_info(id, opts)
      data
    end

    # Get the Vrbo fees
    # Cleaning, pet and extra-guest fees and custom fees, with their type (per stay / per night) and whether they are taxable.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingFees200Response, Integer, Hash)>] GetVrboListingFees200Response data, response status code and response headers
    def get_vrbo_listing_fees_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_fees ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_fees"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/fees'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingFees200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_fees",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_fees\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo house rules
    # Check-in/out times, maximum guests and adults, minimum age, children (with age bands), pets (count, weight), smoking (inside/outside), events (attendee cap), up to 3 custom rules, the rental agreement.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingHouseRules200Response]
    def get_vrbo_listing_house_rules(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_house_rules_with_http_info(id, opts)
      data
    end

    # Get the Vrbo house rules
    # Check-in/out times, maximum guests and adults, minimum age, children (with age bands), pets (count, weight), smoking (inside/outside), events (attendee cap), up to 3 custom rules, the rental agreement.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingHouseRules200Response, Integer, Hash)>] GetVrboListingHouseRules200Response data, response status code and response headers
    def get_vrbo_listing_house_rules_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_house_rules ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_house_rules"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/house-rules'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingHouseRules200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_house_rules",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_house_rules\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo map setting
    # The address (read-only: Vrbo changes it only through its support) and whether guests see the exact location or an area.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingLocation200Response]
    def get_vrbo_listing_location(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_location_with_http_info(id, opts)
      data
    end

    # Get the Vrbo map setting
    # The address (read-only: Vrbo changes it only through its support) and whether guests see the exact location or an area.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingLocation200Response, Integer, Hash)>] GetVrboListingLocation200Response data, response status code and response headers
    def get_vrbo_listing_location_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_location ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_location"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/location'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingLocation200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_location",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_location\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo payment terms
    # How much the guest pays at booking and when the rest is due.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingPaymentTerms200Response]
    def get_vrbo_listing_payment_terms(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_payment_terms_with_http_info(id, opts)
      data
    end

    # Get the Vrbo payment terms
    # How much the guest pays at booking and when the rest is due.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingPaymentTerms200Response, Integer, Hash)>] GetVrboListingPaymentTerms200Response data, response status code and response headers
    def get_vrbo_listing_payment_terms_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_payment_terms ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_payment_terms"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/payment-terms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingPaymentTerms200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_payment_terms",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_payment_terms\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo photos
    # Photos in order (id, url, caption, Vrbo's own tags, rank, rooms), plus any Vrbo moderation rejected and why.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingPhotos200Response]
    def get_vrbo_listing_photos(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_photos_with_http_info(id, opts)
      data
    end

    # Get the Vrbo photos
    # Photos in order (id, url, caption, Vrbo&#39;s own tags, rank, rooms), plus any Vrbo moderation rejected and why.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingPhotos200Response, Integer, Hash)>] GetVrboListingPhotos200Response data, response status code and response headers
    def get_vrbo_listing_photos_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_photos ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_photos"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/photos'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingPhotos200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_photos",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_photos\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo base pricing
    # Base nightly rate per weekday, weekly and monthly discounts, default minimum stay, rate limits.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingPricing200Response]
    def get_vrbo_listing_pricing(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_pricing_with_http_info(id, opts)
      data
    end

    # Get the Vrbo base pricing
    # Base nightly rate per weekday, weekly and monthly discounts, default minimum stay, rate limits.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingPricing200Response, Integer, Hash)>] GetVrboListingPricing200Response data, response status code and response headers
    def get_vrbo_listing_pricing_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_pricing ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_pricing"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/pricing'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingPricing200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_pricing",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_pricing\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo property details
    # Property type (and the types Vrbo offers), internal name, interior size, seniors-only and long-term-renter flags.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingProperty200Response]
    def get_vrbo_listing_property(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_property_with_http_info(id, opts)
      data
    end

    # Get the Vrbo property details
    # Property type (and the types Vrbo offers), internal name, interior size, seniors-only and long-term-renter flags.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingProperty200Response, Integer, Hash)>] GetVrboListingProperty200Response data, response status code and response headers
    def get_vrbo_listing_property_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_property ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_property"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/property'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingProperty200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_property",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_property\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo damage protection
    # Refundable damage deposit and damage protection.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingProtection200Response]
    def get_vrbo_listing_protection(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_protection_with_http_info(id, opts)
      data
    end

    # Get the Vrbo damage protection
    # Refundable damage deposit and damage protection.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingProtection200Response, Integer, Hash)>] GetVrboListingProtection200Response data, response status code and response headers
    def get_vrbo_listing_protection_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_protection ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_protection"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/protection'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingProtection200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_protection",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_protection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo rates and stay discounts
    # Per night over a date range: the nightly rate, its weekday, the weekly (7–27 nights) and monthly (28+ nights) discounts and the minimum stay. Vrbo offers only these two stay discounts, saved per night with the weekday prices.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo calendar call (`?start=&end=`, default today + 13 days) on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [Date] :start First night to read (default today).
    # @option opts [Date] :_end Last night to read (default start + 13 days; at most 3 years).
    # @return [GetVrboListingRates200Response]
    def get_vrbo_listing_rates(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_rates_with_http_info(id, opts)
      data
    end

    # Get the Vrbo rates and stay discounts
    # Per night over a date range: the nightly rate, its weekday, the weekly (7–27 nights) and monthly (28+ nights) discounts and the minimum stay. Vrbo offers only these two stay discounts, saved per night with the weekday prices.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo calendar call (&#x60;?start&#x3D;&amp;end&#x3D;&#x60;, default today + 13 days) on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [Date] :start First night to read (default today).
    # @option opts [Date] :_end Last night to read (default start + 13 days; at most 3 years).
    # @return [Array<(GetVrboListingRates200Response, Integer, Hash)>] GetVrboListingRates200Response data, response status code and response headers
    def get_vrbo_listing_rates_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_rates ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_rates"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/rates'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'start'] = opts[:'start'] if !opts[:'start'].nil?
      query_params[:'end'] = opts[:'_end'] if !opts[:'_end'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingRates200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_rates",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_rates\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo registration / licence
    # The local registration or licence fields Vrbo asks for in the listing's jurisdiction, and their status.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingRegistration200Response]
    def get_vrbo_listing_registration(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_registration_with_http_info(id, opts)
      data
    end

    # Get the Vrbo registration / licence
    # The local registration or licence fields Vrbo asks for in the listing&#39;s jurisdiction, and their status.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingRegistration200Response, Integer, Hash)>] GetVrboListingRegistration200Response data, response status code and response headers
    def get_vrbo_listing_registration_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_registration ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_registration"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/registration'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingRegistration200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_registration",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_registration\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo rooms and spaces
    # Bedrooms, bathrooms, living rooms and other spaces with their beds and room amenities; the space, bed and bathroom types Vrbo offers.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call + 1 per room on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingRooms200Response]
    def get_vrbo_listing_rooms(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_rooms_with_http_info(id, opts)
      data
    end

    # Get the Vrbo rooms and spaces
    # Bedrooms, bathrooms, living rooms and other spaces with their beds and room amenities; the space, bed and bathroom types Vrbo offers.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call + 1 per room on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingRooms200Response, Integer, Hash)>] GetVrboListingRooms200Response data, response status code and response headers
    def get_vrbo_listing_rooms_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_rooms ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_rooms"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/rooms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingRooms200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_rooms",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_rooms\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo host story
    # \"Your story\" on the listing: about you, why this property, what makes it unique.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingStory200Response]
    def get_vrbo_listing_story(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_story_with_http_info(id, opts)
      data
    end

    # Get the Vrbo host story
    # \&quot;Your story\&quot; on the listing: about you, why this property, what makes it unique.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingStory200Response, Integer, Hash)>] GetVrboListingStory200Response data, response status code and response headers
    def get_vrbo_listing_story_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_story ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_story"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/story'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingStory200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_story",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_story\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo taxes
    # Who collects tax and the rules that apply. Where Vrbo collects (e.g. British Columbia) the rules are read-only.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingTaxes200Response]
    def get_vrbo_listing_taxes(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_taxes_with_http_info(id, opts)
      data
    end

    # Get the Vrbo taxes
    # Who collects tax and the rules that apply. Where Vrbo collects (e.g. British Columbia) the rules are read-only.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingTaxes200Response, Integer, Hash)>] GetVrboListingTaxes200Response data, response status code and response headers
    def get_vrbo_listing_taxes_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_taxes ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_taxes"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/taxes'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingTaxes200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_taxes",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_taxes\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo manual translations
    # Headline and description written per language (they replace Vrbo's automatic translation), and the languages Vrbo offers.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call + 1 per language on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingTranslations200Response]
    def get_vrbo_listing_translations(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_translations_with_http_info(id, opts)
      data
    end

    # Get the Vrbo manual translations
    # Headline and description written per language (they replace Vrbo&#39;s automatic translation), and the languages Vrbo offers.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call + 1 per language on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingTranslations200Response, Integer, Hash)>] GetVrboListingTranslations200Response data, response status code and response headers
    def get_vrbo_listing_translations_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_translations ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_translations"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/translations'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingTranslations200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_translations",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_translations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo videos
    # The listing's videos with their file name, Vrbo's processing and review status, player and thumbnail URLs, upload time and any reasons Vrbo rejected them.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingVideos200Response]
    def get_vrbo_listing_videos(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_videos_with_http_info(id, opts)
      data
    end

    # Get the Vrbo videos
    # The listing&#39;s videos with their file name, Vrbo&#39;s processing and review status, player and thumbnail URLs, upload time and any reasons Vrbo rejected them.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingVideos200Response, Integer, Hash)>] GetVrboListingVideos200Response data, response status code and response headers
    def get_vrbo_listing_videos_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_videos ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_videos"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/videos'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingVideos200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_videos",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_videos\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo welcome guide
    # What guests receive before arrival: check-in and check-out instructions, driving and parking directions, access (type, code), wifi, per-amenity instructions, contacts.  Read live from the listing's Vrbo listing in the host's connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingWelcomeGuide200Response]
    def get_vrbo_listing_welcome_guide(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_welcome_guide_with_http_info(id, opts)
      data
    end

    # Get the Vrbo welcome guide
    # What guests receive before arrival: check-in and check-out instructions, driving and parking directions, access (type, code), wifi, per-amenity instructions, contacts.  Read live from the listing&#39;s Vrbo listing in the host&#39;s connected Vrbo account. **Cost:** 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds. Vrbo is read live on every request (nothing is cached), so read the section you need rather than polling.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingWelcomeGuide200Response, Integer, Hash)>] GetVrboListingWelcomeGuide200Response data, response status code and response headers
    def get_vrbo_listing_welcome_guide_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_welcome_guide ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_welcome_guide"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/welcome-guide'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingWelcomeGuide200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_welcome_guide",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_welcome_guide\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List VRBO listings
    # List the Vrbo units linked to this workspace's listings, from the host's connected Vrbo account (host sign-in, beta).  Inactive listings are left out unless `?status=inactive|all` asks for them; they then come back with identity fields only (ids, `listingName`, `listingCity`, `status`, `inactiveReason`). They keep syncing and are complete again once activated.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :status &#x60;active&#x60; (default) leaves inactive listings out. &#x60;inactive&#x60; returns only them and &#x60;all&#x60; returns both. An inactive listing comes back with identity fields only (ids, &#x60;name&#x60;, &#x60;city&#x60;, &#x60;status&#x60;, &#x60;inactiveReason&#x60;, its account), which is enough to show what can be activated. Every row carries &#x60;status&#x60;. (default to 'active')
    # @return [Array<VrboListing>]
    def list_vrbo_listings(opts = {})
      data, _status_code, _headers = list_vrbo_listings_with_http_info(opts)
      data
    end

    # List VRBO listings
    # List the Vrbo units linked to this workspace&#39;s listings, from the host&#39;s connected Vrbo account (host sign-in, beta).  Inactive listings are left out unless &#x60;?status&#x3D;inactive|all&#x60; asks for them; they then come back with identity fields only (ids, &#x60;listingName&#x60;, &#x60;listingCity&#x60;, &#x60;status&#x60;, &#x60;inactiveReason&#x60;). They keep syncing and are complete again once activated.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :status &#x60;active&#x60; (default) leaves inactive listings out. &#x60;inactive&#x60; returns only them and &#x60;all&#x60; returns both. An inactive listing comes back with identity fields only (ids, &#x60;name&#x60;, &#x60;city&#x60;, &#x60;status&#x60;, &#x60;inactiveReason&#x60;, its account), which is enough to show what can be activated. Every row carries &#x60;status&#x60;. (default to 'active')
    # @return [Array<(Array<VrboListing>, Integer, Hash)>] Array<VrboListing> data, response status code and response headers
    def list_vrbo_listings_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.list_vrbo_listings ...'
      end
      allowable_values = ["active", "inactive", "all"]
      if @api_client.config.client_side_validation && opts[:'status'] && !allowable_values.include?(opts[:'status'])
        fail ArgumentError, "invalid value for \"status\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings'

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
      return_type = opts[:debug_return_type] || 'Array<VrboListing>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.list_vrbo_listings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#list_vrbo_listings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List VRBO reservations
    # Cursor-paginated list of Vrbo reservations imported from the host's connected Vrbo account (host sign-in, beta). The full normalised record — guest, price breakdown, policy — is on `GET /v1/reservations?platform=vrbo`. `?offset=` is accepted as a first-class alias for `?cursor=` (mutually exclusive; offset capped at 10000).  Reservations on inactive listings are left out (counts and cursors included); they keep syncing and reappear once the listing is activated.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :cursor Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;.
    # @option opts [Integer] :offset First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. (default to 0)
    # @option opts [Integer] :limit  (default to 50)
    # @option opts [Boolean] :include_total When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. (default to true)
    # @return [VrboReservationListResponse]
    def list_vrbo_reservations(opts = {})
      data, _status_code, _headers = list_vrbo_reservations_with_http_info(opts)
      data
    end

    # List VRBO reservations
    # Cursor-paginated list of Vrbo reservations imported from the host&#39;s connected Vrbo account (host sign-in, beta). The full normalised record — guest, price breakdown, policy — is on &#x60;GET /v1/reservations?platform&#x3D;vrbo&#x60;. &#x60;?offset&#x3D;&#x60; is accepted as a first-class alias for &#x60;?cursor&#x3D;&#x60; (mutually exclusive; offset capped at 10000).  Reservations on inactive listings are left out (counts and cursors included); they keep syncing and reappear once the listing is activated.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :cursor Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;.
    # @option opts [Integer] :offset First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. (default to 0)
    # @option opts [Integer] :limit  (default to 50)
    # @option opts [Boolean] :include_total When &#x60;true&#x60; (default), the response&#39;s &#x60;pagination.total&#x60; carries the count of rows matching the current filter, across all pages. Pass &#x60;false&#x60; to skip the count for very large workspaces where the per-page COUNT(*) cost matters. (default to true)
    # @return [Array<(VrboReservationListResponse, Integer, Hash)>] VrboReservationListResponse data, response status code and response headers
    def list_vrbo_reservations_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.list_vrbo_reservations ...'
      end
      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] > 10000
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling VRBOApi.list_vrbo_reservations, must be smaller than or equal to 10000.'
      end

      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] < 0
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling VRBOApi.list_vrbo_reservations, must be greater than or equal to 0.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling VRBOApi.list_vrbo_reservations, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling VRBOApi.list_vrbo_reservations, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/v1/channels/vrbo/reservations'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
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
      return_type = opts[:debug_return_type] || 'VrboReservationListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.list_vrbo_reservations",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#list_vrbo_reservations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo additional details
    # Change the additional details of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `property`, `bedrooms`, `bathrooms`.  **Cost:** 1 call + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_additional_info_request [UpdateVrboListingAdditionalInfoRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingAdditionalInfo200Response]
    def update_vrbo_listing_additional_info(id, update_vrbo_listing_additional_info_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_additional_info_with_http_info(id, update_vrbo_listing_additional_info_request, opts)
      data
    end

    # Update the Vrbo additional details
    # Change the additional details of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;property&#x60;, &#x60;bedrooms&#x60;, &#x60;bathrooms&#x60;.  **Cost:** 1 call + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_additional_info_request [UpdateVrboListingAdditionalInfoRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingAdditionalInfo200Response, Integer, Hash)>] UpdateVrboListingAdditionalInfo200Response data, response status code and response headers
    def update_vrbo_listing_additional_info_with_http_info(id, update_vrbo_listing_additional_info_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_additional_info ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_additional_info"
      end
      # verify the required parameter 'update_vrbo_listing_additional_info_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_additional_info_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_additional_info_request' when calling VRBOApi.update_vrbo_listing_additional_info"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/additional-info'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_additional_info_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingAdditionalInfo200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_additional_info",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_additional_info\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo amenities
    # Change the amenities of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `groups: {<group>: {values: {<field id>: value}}}`. Checkbox `true`/`false`; choice one of the field's `options`; text and numbers as such. Setting a parent to \"no\" clears its children, as Vrbo's own form does.  **Cost:** 1 call per group written + the read back of those groups on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_amenities_request [UpdateVrboListingAmenitiesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingAmenities200Response]
    def update_vrbo_listing_amenities(id, update_vrbo_listing_amenities_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_amenities_with_http_info(id, update_vrbo_listing_amenities_request, opts)
      data
    end

    # Update the Vrbo amenities
    # Change the amenities of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;groups: {&lt;group&gt;: {values: {&lt;field id&gt;: value}}}&#x60;. Checkbox &#x60;true&#x60;/&#x60;false&#x60;; choice one of the field&#39;s &#x60;options&#x60;; text and numbers as such. Setting a parent to \&quot;no\&quot; clears its children, as Vrbo&#39;s own form does.  **Cost:** 1 call per group written + the read back of those groups on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_amenities_request [UpdateVrboListingAmenitiesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingAmenities200Response, Integer, Hash)>] UpdateVrboListingAmenities200Response data, response status code and response headers
    def update_vrbo_listing_amenities_with_http_info(id, update_vrbo_listing_amenities_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_amenities ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_amenities"
      end
      # verify the required parameter 'update_vrbo_listing_amenities_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_amenities_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_amenities_request' when calling VRBOApi.update_vrbo_listing_amenities"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/amenities'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_amenities_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingAmenities200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_amenities",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_amenities\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo booking settings
    # Change the booking settings of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `bookingType` (`INSTANT`|`QUOTEHOLD`), `minNights`, `minDaysBeforeBooking`, `maxMonthsBeforeBooking` (6, 9, 12, 18 or 24), `maxLengthOfStay`, `accessType`. Values must be ones the read lists. None of these can be cleared once set — **including `accessType`**: Vrbo keeps the last access type, so it can be changed to another but not removed.  **Cost:** 1–3 calls + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_booking_settings_request [UpdateVrboListingBookingSettingsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingBookingSettings200Response]
    def update_vrbo_listing_booking_settings(id, update_vrbo_listing_booking_settings_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_booking_settings_with_http_info(id, update_vrbo_listing_booking_settings_request, opts)
      data
    end

    # Update the Vrbo booking settings
    # Change the booking settings of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;bookingType&#x60; (&#x60;INSTANT&#x60;|&#x60;QUOTEHOLD&#x60;), &#x60;minNights&#x60;, &#x60;minDaysBeforeBooking&#x60;, &#x60;maxMonthsBeforeBooking&#x60; (6, 9, 12, 18 or 24), &#x60;maxLengthOfStay&#x60;, &#x60;accessType&#x60;. Values must be ones the read lists. None of these can be cleared once set — **including &#x60;accessType&#x60;**: Vrbo keeps the last access type, so it can be changed to another but not removed.  **Cost:** 1–3 calls + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_booking_settings_request [UpdateVrboListingBookingSettingsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingBookingSettings200Response, Integer, Hash)>] UpdateVrboListingBookingSettings200Response data, response status code and response headers
    def update_vrbo_listing_booking_settings_with_http_info(id, update_vrbo_listing_booking_settings_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_booking_settings ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_booking_settings"
      end
      # verify the required parameter 'update_vrbo_listing_booking_settings_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_booking_settings_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_booking_settings_request' when calling VRBOApi.update_vrbo_listing_booking_settings"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/booking-settings'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_booking_settings_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingBookingSettings200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_booking_settings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_booking_settings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo cancellation policy
    # Change the cancellation policy of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `policyType` (e.g. `POLICY_TYPE_VR_RELAXED`, `_MODERATE`, `_FIRM`, `_STRICT`, or `POLICY_TYPE_CUSTOM` with `tiers: [{daysBefore, refundPercent}]`). Seasonal overrides are kept.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_cancellation_request [UpdateVrboListingCancellationRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingCancellation200Response]
    def update_vrbo_listing_cancellation(id, update_vrbo_listing_cancellation_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_cancellation_with_http_info(id, update_vrbo_listing_cancellation_request, opts)
      data
    end

    # Update the Vrbo cancellation policy
    # Change the cancellation policy of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;policyType&#x60; (e.g. &#x60;POLICY_TYPE_VR_RELAXED&#x60;, &#x60;_MODERATE&#x60;, &#x60;_FIRM&#x60;, &#x60;_STRICT&#x60;, or &#x60;POLICY_TYPE_CUSTOM&#x60; with &#x60;tiers: [{daysBefore, refundPercent}]&#x60;). Seasonal overrides are kept.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_cancellation_request [UpdateVrboListingCancellationRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingCancellation200Response, Integer, Hash)>] UpdateVrboListingCancellation200Response data, response status code and response headers
    def update_vrbo_listing_cancellation_with_http_info(id, update_vrbo_listing_cancellation_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_cancellation ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_cancellation"
      end
      # verify the required parameter 'update_vrbo_listing_cancellation_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_cancellation_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_cancellation_request' when calling VRBOApi.update_vrbo_listing_cancellation"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/cancellation'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_cancellation_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingCancellation200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_cancellation",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_cancellation\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo headline and description
    # Change the headline and description of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `headline` and/or `description`. Vrbo refuses some characters and words (`( ) * $ €`, other platforms' names, \"covid\") and says which.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_description_request [UpdateVrboListingDescriptionRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingDescription200Response]
    def update_vrbo_listing_description(id, update_vrbo_listing_description_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_description_with_http_info(id, update_vrbo_listing_description_request, opts)
      data
    end

    # Update the Vrbo headline and description
    # Change the headline and description of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;headline&#x60; and/or &#x60;description&#x60;. Vrbo refuses some characters and words (&#x60;( ) * $ €&#x60;, other platforms&#39; names, \&quot;covid\&quot;) and says which.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_description_request [UpdateVrboListingDescriptionRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingDescription200Response, Integer, Hash)>] UpdateVrboListingDescription200Response data, response status code and response headers
    def update_vrbo_listing_description_with_http_info(id, update_vrbo_listing_description_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_description ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_description"
      end
      # verify the required parameter 'update_vrbo_listing_description_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_description_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_description_request' when calling VRBOApi.update_vrbo_listing_description"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/description'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_description_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingDescription200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_description",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_description\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo fees
    # Change the fees of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `cleaning`, `pets`, `extraGuests`, `custom`. `null` clears a fee; `custom` replaces the custom-fee list (`[]` removes them all), each `{productCode, amount, type?, taxable?, taxRate?}` with `productCode` one of the read's `customFeeCodes`.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_fees_request [UpdateVrboListingFeesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingFees200Response]
    def update_vrbo_listing_fees(id, update_vrbo_listing_fees_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_fees_with_http_info(id, update_vrbo_listing_fees_request, opts)
      data
    end

    # Update the Vrbo fees
    # Change the fees of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;cleaning&#x60;, &#x60;pets&#x60;, &#x60;extraGuests&#x60;, &#x60;custom&#x60;. &#x60;null&#x60; clears a fee; &#x60;custom&#x60; replaces the custom-fee list (&#x60;[]&#x60; removes them all), each &#x60;{productCode, amount, type?, taxable?, taxRate?}&#x60; with &#x60;productCode&#x60; one of the read&#39;s &#x60;customFeeCodes&#x60;.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_fees_request [UpdateVrboListingFeesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingFees200Response, Integer, Hash)>] UpdateVrboListingFees200Response data, response status code and response headers
    def update_vrbo_listing_fees_with_http_info(id, update_vrbo_listing_fees_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_fees ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_fees"
      end
      # verify the required parameter 'update_vrbo_listing_fees_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_fees_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_fees_request' when calling VRBOApi.update_vrbo_listing_fees"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/fees'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_fees_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingFees200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_fees",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_fees\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo house rules
    # Change the house rules of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `checkInTime`/`checkOutTime` (`Flexible` or `HH:MM` on the half hour), `maxGuests`, `maxAdults`, `occupancyNote`, `minimumAge`, `minimumAgeNote`, `children`, `pets`, `smoking`, `events`, `customRules` (at most 3). `maxAdults` may not exceed `maxGuests`: when lowering `maxGuests`, send `maxAdults` with it. `maxGuests` cannot be cleared; `minimumAge: null` removes the minimum age.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_house_rules_request [UpdateVrboListingHouseRulesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingHouseRules200Response]
    def update_vrbo_listing_house_rules(id, update_vrbo_listing_house_rules_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_house_rules_with_http_info(id, update_vrbo_listing_house_rules_request, opts)
      data
    end

    # Update the Vrbo house rules
    # Change the house rules of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;checkInTime&#x60;/&#x60;checkOutTime&#x60; (&#x60;Flexible&#x60; or &#x60;HH:MM&#x60; on the half hour), &#x60;maxGuests&#x60;, &#x60;maxAdults&#x60;, &#x60;occupancyNote&#x60;, &#x60;minimumAge&#x60;, &#x60;minimumAgeNote&#x60;, &#x60;children&#x60;, &#x60;pets&#x60;, &#x60;smoking&#x60;, &#x60;events&#x60;, &#x60;customRules&#x60; (at most 3). &#x60;maxAdults&#x60; may not exceed &#x60;maxGuests&#x60;: when lowering &#x60;maxGuests&#x60;, send &#x60;maxAdults&#x60; with it. &#x60;maxGuests&#x60; cannot be cleared; &#x60;minimumAge: null&#x60; removes the minimum age.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_house_rules_request [UpdateVrboListingHouseRulesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingHouseRules200Response, Integer, Hash)>] UpdateVrboListingHouseRules200Response data, response status code and response headers
    def update_vrbo_listing_house_rules_with_http_info(id, update_vrbo_listing_house_rules_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_house_rules ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_house_rules"
      end
      # verify the required parameter 'update_vrbo_listing_house_rules_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_house_rules_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_house_rules_request' when calling VRBOApi.update_vrbo_listing_house_rules"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/house-rules'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_house_rules_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingHouseRules200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_house_rules",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_house_rules\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo map setting
    # Change the map setting of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `showExactLocation: true|false`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_location_request [UpdateVrboListingLocationRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingLocation200Response]
    def update_vrbo_listing_location(id, update_vrbo_listing_location_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_location_with_http_info(id, update_vrbo_listing_location_request, opts)
      data
    end

    # Update the Vrbo map setting
    # Change the map setting of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;showExactLocation: true|false&#x60;.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_location_request [UpdateVrboListingLocationRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingLocation200Response, Integer, Hash)>] UpdateVrboListingLocation200Response data, response status code and response headers
    def update_vrbo_listing_location_with_http_info(id, update_vrbo_listing_location_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_location ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_location"
      end
      # verify the required parameter 'update_vrbo_listing_location_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_location_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_location_request' when calling VRBOApi.update_vrbo_listing_location"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/location'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_location_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingLocation200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_location",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_location\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo payment terms
    # Change the payment terms of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `percentDueNow` and `payments: [{percent, daysBeforeArrival}]`, adding up to 100.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_payment_terms_request [UpdateVrboListingPaymentTermsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingPaymentTerms200Response]
    def update_vrbo_listing_payment_terms(id, update_vrbo_listing_payment_terms_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_payment_terms_with_http_info(id, update_vrbo_listing_payment_terms_request, opts)
      data
    end

    # Update the Vrbo payment terms
    # Change the payment terms of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;percentDueNow&#x60; and &#x60;payments: [{percent, daysBeforeArrival}]&#x60;, adding up to 100.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_payment_terms_request [UpdateVrboListingPaymentTermsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingPaymentTerms200Response, Integer, Hash)>] UpdateVrboListingPaymentTerms200Response data, response status code and response headers
    def update_vrbo_listing_payment_terms_with_http_info(id, update_vrbo_listing_payment_terms_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_payment_terms ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_payment_terms"
      end
      # verify the required parameter 'update_vrbo_listing_payment_terms_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_payment_terms_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_payment_terms_request' when calling VRBOApi.update_vrbo_listing_payment_terms"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/payment-terms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_payment_terms_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingPaymentTerms200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_payment_terms",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_payment_terms\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo photos
    # Change the photos of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `add: [{url, caption?}]` (https URLs Vrbo downloads), `delete: [id]`, `captions: {id: caption}`, `order: [id…]`, `cover: id`. Applied in that order. `order` may list only the first photos; the rest keep their order, and every photo is sent with its new position (as Vrbo's own page does). **Captions are one-way:** Vrbo has not been shown to clear a caption once set, so an empty caption is refused. Each `add` uploads a photo again — it is the one write that is not idempotent.  **Cost:** about 2 calls per photo added, 1 per delete/caption/reorder, plus reads on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_photos_request [UpdateVrboListingPhotosRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingPhotos200Response]
    def update_vrbo_listing_photos(id, update_vrbo_listing_photos_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_photos_with_http_info(id, update_vrbo_listing_photos_request, opts)
      data
    end

    # Update the Vrbo photos
    # Change the photos of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;add: [{url, caption?}]&#x60; (https URLs Vrbo downloads), &#x60;delete: [id]&#x60;, &#x60;captions: {id: caption}&#x60;, &#x60;order: [id…]&#x60;, &#x60;cover: id&#x60;. Applied in that order. &#x60;order&#x60; may list only the first photos; the rest keep their order, and every photo is sent with its new position (as Vrbo&#39;s own page does). **Captions are one-way:** Vrbo has not been shown to clear a caption once set, so an empty caption is refused. Each &#x60;add&#x60; uploads a photo again — it is the one write that is not idempotent.  **Cost:** about 2 calls per photo added, 1 per delete/caption/reorder, plus reads on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_photos_request [UpdateVrboListingPhotosRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingPhotos200Response, Integer, Hash)>] UpdateVrboListingPhotos200Response data, response status code and response headers
    def update_vrbo_listing_photos_with_http_info(id, update_vrbo_listing_photos_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_photos ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_photos"
      end
      # verify the required parameter 'update_vrbo_listing_photos_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_photos_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_photos_request' when calling VRBOApi.update_vrbo_listing_photos"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/photos'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_photos_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingPhotos200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_photos",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_photos\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo base pricing
    # Change the base pricing of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `baseRate`. The answer comes once Vrbo shows the new rate. Nightly prices per date come from the listing calendar (`PUT /v1/availability/{propertyId}`), which Vrbo shows over the base rate. Uses Vrbo's calendar quota: while the listing's calendar push is writing, the answer is `409 vrbo_calendar_busy` with `retry_after` and nothing is changed.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_pricing_request [UpdateVrboListingPricingRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingPricing200Response]
    def update_vrbo_listing_pricing(id, update_vrbo_listing_pricing_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_pricing_with_http_info(id, update_vrbo_listing_pricing_request, opts)
      data
    end

    # Update the Vrbo base pricing
    # Change the base pricing of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;baseRate&#x60;. The answer comes once Vrbo shows the new rate. Nightly prices per date come from the listing calendar (&#x60;PUT /v1/availability/{propertyId}&#x60;), which Vrbo shows over the base rate. Uses Vrbo&#39;s calendar quota: while the listing&#39;s calendar push is writing, the answer is &#x60;409 vrbo_calendar_busy&#x60; with &#x60;retry_after&#x60; and nothing is changed.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_pricing_request [UpdateVrboListingPricingRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingPricing200Response, Integer, Hash)>] UpdateVrboListingPricing200Response data, response status code and response headers
    def update_vrbo_listing_pricing_with_http_info(id, update_vrbo_listing_pricing_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_pricing ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_pricing"
      end
      # verify the required parameter 'update_vrbo_listing_pricing_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_pricing_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_pricing_request' when calling VRBOApi.update_vrbo_listing_pricing"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/pricing'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_pricing_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingPricing200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_pricing",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_pricing\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo property details
    # Change the property details of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `propertyType` (one of `propertyTypeOptions`), `propertyName`, `interiorSize` `{value, unit: sqft|sqm}`, `seniorsOnly`, `longTermRentersWelcome`. `propertyType` and `propertyName` can be changed but not cleared.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_property_request [UpdateVrboListingPropertyRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingProperty200Response]
    def update_vrbo_listing_property(id, update_vrbo_listing_property_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_property_with_http_info(id, update_vrbo_listing_property_request, opts)
      data
    end

    # Update the Vrbo property details
    # Change the property details of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;propertyType&#x60; (one of &#x60;propertyTypeOptions&#x60;), &#x60;propertyName&#x60;, &#x60;interiorSize&#x60; &#x60;{value, unit: sqft|sqm}&#x60;, &#x60;seniorsOnly&#x60;, &#x60;longTermRentersWelcome&#x60;. &#x60;propertyType&#x60; and &#x60;propertyName&#x60; can be changed but not cleared.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_property_request [UpdateVrboListingPropertyRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingProperty200Response, Integer, Hash)>] UpdateVrboListingProperty200Response data, response status code and response headers
    def update_vrbo_listing_property_with_http_info(id, update_vrbo_listing_property_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_property ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_property"
      end
      # verify the required parameter 'update_vrbo_listing_property_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_property_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_property_request' when calling VRBOApi.update_vrbo_listing_property"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/property'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_property_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingProperty200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_property",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_property\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo damage protection
    # Change the damage protection of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `damageDeposit` (`{amount}` or `null`), `damageProtection`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_protection_request [UpdateVrboListingProtectionRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingProtection200Response]
    def update_vrbo_listing_protection(id, update_vrbo_listing_protection_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_protection_with_http_info(id, update_vrbo_listing_protection_request, opts)
      data
    end

    # Update the Vrbo damage protection
    # Change the damage protection of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;damageDeposit&#x60; (&#x60;{amount}&#x60; or &#x60;null&#x60;), &#x60;damageProtection&#x60;.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_protection_request [UpdateVrboListingProtectionRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingProtection200Response, Integer, Hash)>] UpdateVrboListingProtection200Response data, response status code and response headers
    def update_vrbo_listing_protection_with_http_info(id, update_vrbo_listing_protection_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_protection ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_protection"
      end
      # verify the required parameter 'update_vrbo_listing_protection_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_protection_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_protection_request' when calling VRBOApi.update_vrbo_listing_protection"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/protection'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_protection_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingProtection200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_protection",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_protection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo rates and stay discounts
    # Change the rates and stay discounts of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `startDate`, `endDate` (at most 3 years) and any of `nightlyRate` (one price), `nightlyRates` (`{sunday…saturday}`), `weeklyDiscountPercent`, `monthlyDiscountPercent` (0–99). A discount-only write keeps the current prices when each weekday has one price in the range; otherwise send `nightlyRates`. Nightly prices belong to the listing calendar (`PUT /v1/availability/{propertyId}`), whose push to Vrbo may put back a price set here; use this for the discounts and for prices on nights the calendar does not manage. While the listing's calendar push is writing, the answer is `409 vrbo_calendar_busy` with `retry_after` and nothing is changed.  **Cost:** 1–2 calendar calls + 1 to read back (Vrbo's calendar quota, the one price pushes use) on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_rates_request [UpdateVrboListingRatesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingRates200Response]
    def update_vrbo_listing_rates(id, update_vrbo_listing_rates_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_rates_with_http_info(id, update_vrbo_listing_rates_request, opts)
      data
    end

    # Update the Vrbo rates and stay discounts
    # Change the rates and stay discounts of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;startDate&#x60;, &#x60;endDate&#x60; (at most 3 years) and any of &#x60;nightlyRate&#x60; (one price), &#x60;nightlyRates&#x60; (&#x60;{sunday…saturday}&#x60;), &#x60;weeklyDiscountPercent&#x60;, &#x60;monthlyDiscountPercent&#x60; (0–99). A discount-only write keeps the current prices when each weekday has one price in the range; otherwise send &#x60;nightlyRates&#x60;. Nightly prices belong to the listing calendar (&#x60;PUT /v1/availability/{propertyId}&#x60;), whose push to Vrbo may put back a price set here; use this for the discounts and for prices on nights the calendar does not manage. While the listing&#39;s calendar push is writing, the answer is &#x60;409 vrbo_calendar_busy&#x60; with &#x60;retry_after&#x60; and nothing is changed.  **Cost:** 1–2 calendar calls + 1 to read back (Vrbo&#39;s calendar quota, the one price pushes use) on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_rates_request [UpdateVrboListingRatesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingRates200Response, Integer, Hash)>] UpdateVrboListingRates200Response data, response status code and response headers
    def update_vrbo_listing_rates_with_http_info(id, update_vrbo_listing_rates_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_rates ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_rates"
      end
      # verify the required parameter 'update_vrbo_listing_rates_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_rates_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_rates_request' when calling VRBOApi.update_vrbo_listing_rates"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/rates'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_rates_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingRates200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_rates",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_rates\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo registration / licence
    # Change the registration / licence of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `settings: [{name, value}]` with the `name`s the read lists (they differ per city). Vrbo checks them against the registry.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_registration_request [UpdateVrboListingRegistrationRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingRegistration200Response]
    def update_vrbo_listing_registration(id, update_vrbo_listing_registration_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_registration_with_http_info(id, update_vrbo_listing_registration_request, opts)
      data
    end

    # Update the Vrbo registration / licence
    # Change the registration / licence of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;settings: [{name, value}]&#x60; with the &#x60;name&#x60;s the read lists (they differ per city). Vrbo checks them against the registry.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_registration_request [UpdateVrboListingRegistrationRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingRegistration200Response, Integer, Hash)>] UpdateVrboListingRegistration200Response data, response status code and response headers
    def update_vrbo_listing_registration_with_http_info(id, update_vrbo_listing_registration_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_registration ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_registration"
      end
      # verify the required parameter 'update_vrbo_listing_registration_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_registration_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_registration_request' when calling VRBOApi.update_vrbo_listing_registration"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/registration'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_registration_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingRegistration200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_registration",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_registration\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo rooms and spaces
    # Change the rooms and spaces of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `add: [{type, name?, subType?, description?, beds?, amenities?}]`, `update: [{spaceId, …}]`, `delete: [spaceId]`. Beds `{type, size?, quantity 1–99}`: `type` one of the read's `bedTypes`, and `size` is required where that bed type lists `sizes` (bunk, sofa…). **A room description can be replaced but not cleared** (Vrbo never saves an empty one), so an empty `description` is refused.  **Cost:** 1 call per room changed + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_rooms_request [UpdateVrboListingRoomsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingRooms200Response]
    def update_vrbo_listing_rooms(id, update_vrbo_listing_rooms_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_rooms_with_http_info(id, update_vrbo_listing_rooms_request, opts)
      data
    end

    # Update the Vrbo rooms and spaces
    # Change the rooms and spaces of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;add: [{type, name?, subType?, description?, beds?, amenities?}]&#x60;, &#x60;update: [{spaceId, …}]&#x60;, &#x60;delete: [spaceId]&#x60;. Beds &#x60;{type, size?, quantity 1–99}&#x60;: &#x60;type&#x60; one of the read&#39;s &#x60;bedTypes&#x60;, and &#x60;size&#x60; is required where that bed type lists &#x60;sizes&#x60; (bunk, sofa…). **A room description can be replaced but not cleared** (Vrbo never saves an empty one), so an empty &#x60;description&#x60; is refused.  **Cost:** 1 call per room changed + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_rooms_request [UpdateVrboListingRoomsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingRooms200Response, Integer, Hash)>] UpdateVrboListingRooms200Response data, response status code and response headers
    def update_vrbo_listing_rooms_with_http_info(id, update_vrbo_listing_rooms_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_rooms ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_rooms"
      end
      # verify the required parameter 'update_vrbo_listing_rooms_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_rooms_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_rooms_request' when calling VRBOApi.update_vrbo_listing_rooms"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/rooms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_rooms_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingRooms200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_rooms",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_rooms\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo host story
    # Change the host story of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `aboutYou`, `whyThisProperty`, `uniqueBenefits`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_story_request [UpdateVrboListingStoryRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingStory200Response]
    def update_vrbo_listing_story(id, update_vrbo_listing_story_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_story_with_http_info(id, update_vrbo_listing_story_request, opts)
      data
    end

    # Update the Vrbo host story
    # Change the host story of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;aboutYou&#x60;, &#x60;whyThisProperty&#x60;, &#x60;uniqueBenefits&#x60;.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_story_request [UpdateVrboListingStoryRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingStory200Response, Integer, Hash)>] UpdateVrboListingStory200Response data, response status code and response headers
    def update_vrbo_listing_story_with_http_info(id, update_vrbo_listing_story_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_story ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_story"
      end
      # verify the required parameter 'update_vrbo_listing_story_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_story_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_story_request' when calling VRBOApi.update_vrbo_listing_story"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/story'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_story_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingStory200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_story",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_story\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo taxes
    # Change the taxes of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `tax`, `stayTax` or `partnerTaxSettings`, in Vrbo's shape (see the read's `raw`).  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_taxes_request [UpdateVrboListingTaxesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingTaxes200Response]
    def update_vrbo_listing_taxes(id, update_vrbo_listing_taxes_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_taxes_with_http_info(id, update_vrbo_listing_taxes_request, opts)
      data
    end

    # Update the Vrbo taxes
    # Change the taxes of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;tax&#x60;, &#x60;stayTax&#x60; or &#x60;partnerTaxSettings&#x60;, in Vrbo&#39;s shape (see the read&#39;s &#x60;raw&#x60;).  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_taxes_request [UpdateVrboListingTaxesRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingTaxes200Response, Integer, Hash)>] UpdateVrboListingTaxes200Response data, response status code and response headers
    def update_vrbo_listing_taxes_with_http_info(id, update_vrbo_listing_taxes_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_taxes ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_taxes"
      end
      # verify the required parameter 'update_vrbo_listing_taxes_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_taxes_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_taxes_request' when calling VRBOApi.update_vrbo_listing_taxes"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/taxes'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_taxes_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingTaxes200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_taxes",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_taxes\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo manual translations
    # Change the manual translations of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `set: [{locale, headline, description}]` and/or `delete: [locale]`.  **Cost:** 1 call per language + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_translations_request [UpdateVrboListingTranslationsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingTranslations200Response]
    def update_vrbo_listing_translations(id, update_vrbo_listing_translations_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_translations_with_http_info(id, update_vrbo_listing_translations_request, opts)
      data
    end

    # Update the Vrbo manual translations
    # Change the manual translations of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;set: [{locale, headline, description}]&#x60; and/or &#x60;delete: [locale]&#x60;.  **Cost:** 1 call per language + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_translations_request [UpdateVrboListingTranslationsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingTranslations200Response, Integer, Hash)>] UpdateVrboListingTranslations200Response data, response status code and response headers
    def update_vrbo_listing_translations_with_http_info(id, update_vrbo_listing_translations_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_translations ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_translations"
      end
      # verify the required parameter 'update_vrbo_listing_translations_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_translations_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_translations_request' when calling VRBOApi.update_vrbo_listing_translations"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/translations'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_translations_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingTranslations200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_translations",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_translations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo welcome guide
    # Change the welcome guide of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `checkIn`, `checkOut`, `drivingDirections`, `parkingDirections` (`{instructions}`), `wifi`, `access`, `amenities` (`{AMENITY_ID: {instructions}}`). **The notes are one-way:** Vrbo has not been shown to remove a note once added, so `null` and empty text are refused — change a note to other text instead.  **Cost:** 1–2 calls per item + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data` (fields Vrbo accepted in the same request are saved). A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_welcome_guide_request [UpdateVrboListingWelcomeGuideRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingWelcomeGuide200Response]
    def update_vrbo_listing_welcome_guide(id, update_vrbo_listing_welcome_guide_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_welcome_guide_with_http_info(id, update_vrbo_listing_welcome_guide_request, opts)
      data
    end

    # Update the Vrbo welcome guide
    # Change the welcome guide of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;checkIn&#x60;, &#x60;checkOut&#x60;, &#x60;drivingDirections&#x60;, &#x60;parkingDirections&#x60; (&#x60;{instructions}&#x60;), &#x60;wifi&#x60;, &#x60;access&#x60;, &#x60;amenities&#x60; (&#x60;{AMENITY_ID: {instructions}}&#x60;). **The notes are one-way:** Vrbo has not been shown to remove a note once added, so &#x60;null&#x60; and empty text are refused — change a note to other text instead.  **Cost:** 1–2 calls per item + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60; (fields Vrbo accepted in the same request are saved). A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_welcome_guide_request [UpdateVrboListingWelcomeGuideRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingWelcomeGuide200Response, Integer, Hash)>] UpdateVrboListingWelcomeGuide200Response data, response status code and response headers
    def update_vrbo_listing_welcome_guide_with_http_info(id, update_vrbo_listing_welcome_guide_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_welcome_guide ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_welcome_guide"
      end
      # verify the required parameter 'update_vrbo_listing_welcome_guide_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_welcome_guide_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_welcome_guide_request' when calling VRBOApi.update_vrbo_listing_welcome_guide"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/welcome-guide'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_welcome_guide_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingWelcomeGuide200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_welcome_guide",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_welcome_guide\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
