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
    # Add photos to the Vrbo listing
    # Add 1–20 photos, each from an https `url` Vrbo downloads or as base64 `image` data (like Airbnb's upload), with an optional `caption`. New photos go to the end; move them with PATCH or PUT …/photos/order.  **Cost:** about 2 Vrbo calls per photo, then the photos are read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param add_vrbo_listing_photos_request [AddVrboListingPhotosRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [AddVrboListingPhotos200Response]
    def add_vrbo_listing_photos(id, add_vrbo_listing_photos_request, opts = {})
      data, _status_code, _headers = add_vrbo_listing_photos_with_http_info(id, add_vrbo_listing_photos_request, opts)
      data
    end

    # Add photos to the Vrbo listing
    # Add 1–20 photos, each from an https &#x60;url&#x60; Vrbo downloads or as base64 &#x60;image&#x60; data (like Airbnb&#39;s upload), with an optional &#x60;caption&#x60;. New photos go to the end; move them with PATCH or PUT …/photos/order.  **Cost:** about 2 Vrbo calls per photo, then the photos are read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param add_vrbo_listing_photos_request [AddVrboListingPhotosRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(AddVrboListingPhotos200Response, Integer, Hash)>] AddVrboListingPhotos200Response data, response status code and response headers
    def add_vrbo_listing_photos_with_http_info(id, add_vrbo_listing_photos_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.add_vrbo_listing_photos ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.add_vrbo_listing_photos"
      end
      # verify the required parameter 'add_vrbo_listing_photos_request' is set
      if @api_client.config.client_side_validation && add_vrbo_listing_photos_request.nil?
        fail ArgumentError, "Missing the required parameter 'add_vrbo_listing_photos_request' when calling VRBOApi.add_vrbo_listing_photos"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(add_vrbo_listing_photos_request)

      # return_type
      return_type = opts[:debug_return_type] || 'AddVrboListingPhotos200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.add_vrbo_listing_photos",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#add_vrbo_listing_photos\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Add a room to the Vrbo listing
    # Add one room with its beds. Room types: Airbnb's words (`bedroom`, `bathroom`, `living_room`, `office`) or Vrbo's (BEDROOM, BATHROOM, LIVING_ROOM, OFFICE) — Vrbo has no other room types; describe a kitchen or outdoor space with the amenities.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param add_vrbo_listing_room_request [AddVrboListingRoomRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingRoom200Response]
    def add_vrbo_listing_room(id, add_vrbo_listing_room_request, opts = {})
      data, _status_code, _headers = add_vrbo_listing_room_with_http_info(id, add_vrbo_listing_room_request, opts)
      data
    end

    # Add a room to the Vrbo listing
    # Add one room with its beds. Room types: Airbnb&#39;s words (&#x60;bedroom&#x60;, &#x60;bathroom&#x60;, &#x60;living_room&#x60;, &#x60;office&#x60;) or Vrbo&#39;s (BEDROOM, BATHROOM, LIVING_ROOM, OFFICE) — Vrbo has no other room types; describe a kitchen or outdoor space with the amenities.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param add_vrbo_listing_room_request [AddVrboListingRoomRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingRoom200Response, Integer, Hash)>] UpdateVrboListingRoom200Response data, response status code and response headers
    def add_vrbo_listing_room_with_http_info(id, add_vrbo_listing_room_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.add_vrbo_listing_room ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.add_vrbo_listing_room"
      end
      # verify the required parameter 'add_vrbo_listing_room_request' is set
      if @api_client.config.client_side_validation && add_vrbo_listing_room_request.nil?
        fail ArgumentError, "Missing the required parameter 'add_vrbo_listing_room_request' when calling VRBOApi.add_vrbo_listing_room"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(add_vrbo_listing_room_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingRoom200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.add_vrbo_listing_room",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#add_vrbo_listing_room\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
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

    # Change a Vrbo reservation
    # Change an existing Vrbo booking — the counterpart of `POST /v1/channels/airbnb/alterations`. Send `confirmation_code` and what changes: `check_in`, `check_out`, `check_in_time` / `check_out_time` (`HH:MM` on the hour or half hour), `number_of_adults`, `number_of_children`, `pets`; for the price, `rent_amount` (the new rent — Vrbo adds its fees and taxes) or `keep_original_price: true`. Fields you leave out keep the booking's values.  Unlike Airbnb, the change is made at once (the guest does not accept it); when the guest owes more, Vrbo requests it by `payment_due_date`. **`preview: true`** returns Vrbo's dry run — `before`, `after`, the price difference (`payment`, or `priceUnchanged`) and the due-date range — and changes nothing.  Vrbo's rules are checked first and refused by field: e.g. a pay-later booking's check-in cannot move, guests are capped by the listing. `GET /v1/channels/vrbo/reservations/{code}?options=change` shows the booking's values and limits. Airbnb fields with no Vrbo equivalent are refused by name: `number_of_guests` (send adults and children), `total_price` (send `rent_amount`), `listing_id` (Vrbo cannot move a booking to another unit).
    # @param create_vrbo_alteration_request [CreateVrboAlterationRequest] 
    # @param [Hash] opts the optional parameters
    # @return [CreateVrboAlteration200Response]
    def create_vrbo_alteration(create_vrbo_alteration_request, opts = {})
      data, _status_code, _headers = create_vrbo_alteration_with_http_info(create_vrbo_alteration_request, opts)
      data
    end

    # Change a Vrbo reservation
    # Change an existing Vrbo booking — the counterpart of &#x60;POST /v1/channels/airbnb/alterations&#x60;. Send &#x60;confirmation_code&#x60; and what changes: &#x60;check_in&#x60;, &#x60;check_out&#x60;, &#x60;check_in_time&#x60; / &#x60;check_out_time&#x60; (&#x60;HH:MM&#x60; on the hour or half hour), &#x60;number_of_adults&#x60;, &#x60;number_of_children&#x60;, &#x60;pets&#x60;; for the price, &#x60;rent_amount&#x60; (the new rent — Vrbo adds its fees and taxes) or &#x60;keep_original_price: true&#x60;. Fields you leave out keep the booking&#39;s values.  Unlike Airbnb, the change is made at once (the guest does not accept it); when the guest owes more, Vrbo requests it by &#x60;payment_due_date&#x60;. **&#x60;preview: true&#x60;** returns Vrbo&#39;s dry run — &#x60;before&#x60;, &#x60;after&#x60;, the price difference (&#x60;payment&#x60;, or &#x60;priceUnchanged&#x60;) and the due-date range — and changes nothing.  Vrbo&#39;s rules are checked first and refused by field: e.g. a pay-later booking&#39;s check-in cannot move, guests are capped by the listing. &#x60;GET /v1/channels/vrbo/reservations/{code}?options&#x3D;change&#x60; shows the booking&#39;s values and limits. Airbnb fields with no Vrbo equivalent are refused by name: &#x60;number_of_guests&#x60; (send adults and children), &#x60;total_price&#x60; (send &#x60;rent_amount&#x60;), &#x60;listing_id&#x60; (Vrbo cannot move a booking to another unit).
    # @param create_vrbo_alteration_request [CreateVrboAlterationRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateVrboAlteration200Response, Integer, Hash)>] CreateVrboAlteration200Response data, response status code and response headers
    def create_vrbo_alteration_with_http_info(create_vrbo_alteration_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.create_vrbo_alteration ...'
      end
      # verify the required parameter 'create_vrbo_alteration_request' is set
      if @api_client.config.client_side_validation && create_vrbo_alteration_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_vrbo_alteration_request' when calling VRBOApi.create_vrbo_alteration"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/alterations'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(create_vrbo_alteration_request)

      # return_type
      return_type = opts[:debug_return_type] || 'CreateVrboAlteration200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.create_vrbo_alteration",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#create_vrbo_alteration\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Remove a Vrbo translation
    # Remove the hand-written translation for `locale`; Vrbo goes back to translating that language automatically. The listing's own description cannot be removed, only changed. The answer is every language left.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param locale [String] The language to remove.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingDescriptions200Response]
    def delete_vrbo_listing_description(id, locale, opts = {})
      data, _status_code, _headers = delete_vrbo_listing_description_with_http_info(id, locale, opts)
      data
    end

    # Remove a Vrbo translation
    # Remove the hand-written translation for &#x60;locale&#x60;; Vrbo goes back to translating that language automatically. The listing&#39;s own description cannot be removed, only changed. The answer is every language left.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param locale [String] The language to remove.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingDescriptions200Response, Integer, Hash)>] UpdateVrboListingDescriptions200Response data, response status code and response headers
    def delete_vrbo_listing_description_with_http_info(id, locale, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.delete_vrbo_listing_description ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.delete_vrbo_listing_description"
      end
      # verify the required parameter 'locale' is set
      if @api_client.config.client_side_validation && locale.nil?
        fail ArgumentError, "Missing the required parameter 'locale' when calling VRBOApi.delete_vrbo_listing_description"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/descriptions'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'locale'] = locale
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
      return_type = opts[:debug_return_type] || 'UpdateVrboListingDescriptions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.delete_vrbo_listing_description",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#delete_vrbo_listing_description\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Remove Vrbo photos
    # Remove photos by `photoId` (comma-separated for several). Photo ids are the `id`s of GET …/photos.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param photo_id [String] The &#x60;id&#x60; of the photo to remove (comma-separated for several).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [AddVrboListingPhotos200Response]
    def delete_vrbo_listing_photos(id, photo_id, opts = {})
      data, _status_code, _headers = delete_vrbo_listing_photos_with_http_info(id, photo_id, opts)
      data
    end

    # Remove Vrbo photos
    # Remove photos by &#x60;photoId&#x60; (comma-separated for several). Photo ids are the &#x60;id&#x60;s of GET …/photos.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param photo_id [String] The &#x60;id&#x60; of the photo to remove (comma-separated for several).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(AddVrboListingPhotos200Response, Integer, Hash)>] AddVrboListingPhotos200Response data, response status code and response headers
    def delete_vrbo_listing_photos_with_http_info(id, photo_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.delete_vrbo_listing_photos ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.delete_vrbo_listing_photos"
      end
      # verify the required parameter 'photo_id' is set
      if @api_client.config.client_side_validation && photo_id.nil?
        fail ArgumentError, "Missing the required parameter 'photo_id' when calling VRBOApi.delete_vrbo_listing_photos"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/photos'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'photoId'] = photo_id
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
      return_type = opts[:debug_return_type] || 'AddVrboListingPhotos200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.delete_vrbo_listing_photos",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#delete_vrbo_listing_photos\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Remove a Vrbo room
    # Remove the room `roomId`.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param room_id [String] The room&#39;s &#x60;spaceId&#x60; from GET …/rooms.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingRoom200Response]
    def delete_vrbo_listing_room(id, room_id, opts = {})
      data, _status_code, _headers = delete_vrbo_listing_room_with_http_info(id, room_id, opts)
      data
    end

    # Remove a Vrbo room
    # Remove the room &#x60;roomId&#x60;.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param room_id [String] The room&#39;s &#x60;spaceId&#x60; from GET …/rooms.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingRoom200Response, Integer, Hash)>] UpdateVrboListingRoom200Response data, response status code and response headers
    def delete_vrbo_listing_room_with_http_info(id, room_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.delete_vrbo_listing_room ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.delete_vrbo_listing_room"
      end
      # verify the required parameter 'room_id' is set
      if @api_client.config.client_side_validation && room_id.nil?
        fail ArgumentError, "Missing the required parameter 'room_id' when calling VRBOApi.delete_vrbo_listing_room"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/rooms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'roomId'] = room_id
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
      return_type = opts[:debug_return_type] || 'UpdateVrboListingRoom200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.delete_vrbo_listing_room",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#delete_vrbo_listing_room\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
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

    # Get the Vrbo connection state
    # Whether the workspace's Vrbo accounts are still signed in — the Vrbo counterpart of `GET /v1/channels/airbnb/connection`, with the same `status` values: `connected` (every account), `reconnect_required` (some), `disconnected` (none), `never_connected` (no Vrbo account). `fixUrl` is set whenever an account needs to be reconnected.  Per account: its `account_id`, name, sign-in state, access (`full_access` or `messaging`), the Vrbo units linked through it, when it last synced and its import progress.
    # @param [Hash] opts the optional parameters
    # @return [GetVrboConnection200Response]
    def get_vrbo_connection(opts = {})
      data, _status_code, _headers = get_vrbo_connection_with_http_info(opts)
      data
    end

    # Get the Vrbo connection state
    # Whether the workspace&#39;s Vrbo accounts are still signed in — the Vrbo counterpart of &#x60;GET /v1/channels/airbnb/connection&#x60;, with the same &#x60;status&#x60; values: &#x60;connected&#x60; (every account), &#x60;reconnect_required&#x60; (some), &#x60;disconnected&#x60; (none), &#x60;never_connected&#x60; (no Vrbo account). &#x60;fixUrl&#x60; is set whenever an account needs to be reconnected.  Per account: its &#x60;account_id&#x60;, name, sign-in state, access (&#x60;full_access&#x60; or &#x60;messaging&#x60;), the Vrbo units linked through it, when it last synced and its import progress.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetVrboConnection200Response, Integer, Hash)>] GetVrboConnection200Response data, response status code and response headers
    def get_vrbo_connection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_connection ...'
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/connection'

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
      return_type = opts[:debug_return_type] || 'GetVrboConnection200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_connection",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_connection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo listing
    # Every Vrbo unit linked to the listing (usually one; live ones first), from Repull's own data — no Vrbo call: the Vrbo listing number and URL, Vrbo's status, headline, capacity, rooms, check-in/out, minimum stay, address, rating, the Vrbo account it is on and that account's access.  `?include=content` adds the listing-content sections Repull holds for each unit (descriptions, amenities, house rules, fees, …), so one call returns everything stored.  Returns `404` when the listing is not linked to Vrbo and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :include &#x60;content&#x60;: add the stored listing-content sections.
    # @return [GetVrboListing200Response]
    def get_vrbo_listing(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_with_http_info(id, opts)
      data
    end

    # Get the Vrbo listing
    # Every Vrbo unit linked to the listing (usually one; live ones first), from Repull&#39;s own data — no Vrbo call: the Vrbo listing number and URL, Vrbo&#39;s status, headline, capacity, rooms, check-in/out, minimum stay, address, rating, the Vrbo account it is on and that account&#39;s access.  &#x60;?include&#x3D;content&#x60; adds the listing-content sections Repull holds for each unit (descriptions, amenities, house rules, fees, …), so one call returns everything stored.  Returns &#x60;404&#x60; when the listing is not linked to Vrbo and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :include &#x60;content&#x60;: add the stored listing-content sections.
    # @return [Array<(GetVrboListing200Response, Integer, Hash)>] GetVrboListing200Response data, response status code and response headers
    def get_vrbo_listing_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing"
      end
      allowable_values = ["content"]
      if @api_client.config.client_side_validation && opts[:'include'] && !allowable_values.include?(opts[:'include'])
        fail ArgumentError, "invalid value for \"include\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}'.sub('{id}', CGI.escape(id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetVrboListing200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo additional details
    # The free-text additional details for the property, its bedrooms and its bathrooms.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingAdditionalInfo200Response]
    def get_vrbo_listing_additional_info(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_additional_info_with_http_info(id, opts)
      data
    end

    # Get the Vrbo additional details
    # The free-text additional details for the property, its bedrooms and its bathrooms.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingAdditionalInfo200Response, Integer, Hash)>] GetVrboListingAdditionalInfo200Response data, response status code and response headers
    def get_vrbo_listing_additional_info_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_additional_info ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_additional_info"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/additional-info'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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
    # Vrbo's 19 amenity groups (~440 fields) — each field with its id, type (checkbox, choice, text, number, measurement, checkboxGroup), current value, options and the parent it is shown under (`shownWhen`). Includes location & view, nearby attractions and check-out instructions.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call per group (19 in all; narrow with `?groups=`) on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :groups Amenity groups to read, comma-separated (default: all 19): essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions.
    # @return [GetVrboListingAmenities200Response]
    def get_vrbo_listing_amenities(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_amenities_with_http_info(id, opts)
      data
    end

    # Get the Vrbo amenities
    # Vrbo&#39;s 19 amenity groups (~440 fields) — each field with its id, type (checkbox, choice, text, number, measurement, checkboxGroup), current value, options and the parent it is shown under (&#x60;shownWhen&#x60;). Includes location &amp; view, nearby attractions and check-out instructions.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call per group (19 in all; narrow with &#x60;?groups&#x3D;&#x60;) on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :groups Amenity groups to read, comma-separated (default: all 19): essentials, internet, climateControl, general, office, kitchenAndDining, parking, poolAndSpa, sustainability, entertainment, outdoor, onsiteService, accessibility, homeSafety, safetyDevices, enhancedCleaning, locationAndView, localAttractionsAndActivities, checkoutInstructions.
    # @return [Array<(GetVrboListingAmenities200Response, Integer, Hash)>] GetVrboListingAmenities200Response data, response status code and response headers
    def get_vrbo_listing_amenities_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_amenities ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_amenities"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/amenities'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?
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

    # Get the Vrbo calendar
    # The listing's calendar as Vrbo shows it, night by night — the counterpart of `GET /v1/channels/airbnb/listings/{id}/availability`: whether each night is `available`, what holds it (`blockedBy`: a `reservation`, a `block` or an imported `ical` calendar, with the booking's `reservationRef`), the nightly price, minimum stay and whether guests can arrive or leave that day.  Read from Vrbo for each request (one Vrbo read for the range): `start_date`..`end_date`, at most 366 nights, default the next 30. `?jobId=` reads the status of a write instead.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :start_date First night (default today).
    # @option opts [Date] :end_date Last night (default start + 29 days).
    # @option opts [String] :job_id The &#x60;jobId&#x60; a PUT returned: read that write&#39;s status.
    # @option opts [String] :vrbo_listing_number The Vrbo listing number, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingAvailability200Response]
    def get_vrbo_listing_availability(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_availability_with_http_info(id, opts)
      data
    end

    # Get the Vrbo calendar
    # The listing&#39;s calendar as Vrbo shows it, night by night — the counterpart of &#x60;GET /v1/channels/airbnb/listings/{id}/availability&#x60;: whether each night is &#x60;available&#x60;, what holds it (&#x60;blockedBy&#x60;: a &#x60;reservation&#x60;, a &#x60;block&#x60; or an imported &#x60;ical&#x60; calendar, with the booking&#39;s &#x60;reservationRef&#x60;), the nightly price, minimum stay and whether guests can arrive or leave that day.  Read from Vrbo for each request (one Vrbo read for the range): &#x60;start_date&#x60;..&#x60;end_date&#x60;, at most 366 nights, default the next 30. &#x60;?jobId&#x3D;&#x60; reads the status of a write instead.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :start_date First night (default today).
    # @option opts [Date] :end_date Last night (default start + 29 days).
    # @option opts [String] :job_id The &#x60;jobId&#x60; a PUT returned: read that write&#39;s status.
    # @option opts [String] :vrbo_listing_number The Vrbo listing number, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingAvailability200Response, Integer, Hash)>] GetVrboListingAvailability200Response data, response status code and response headers
    def get_vrbo_listing_availability_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_availability ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_availability"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/availability'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'start_date'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'end_date'] = opts[:'end_date'] if !opts[:'end_date'].nil?
      query_params[:'jobId'] = opts[:'job_id'] if !opts[:'job_id'].nil?
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
      return_type = opts[:debug_return_type] || 'GetVrboListingAvailability200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_availability",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_availability\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo booking settings
    # Instant book or quote-and-hold, minimum nights, notice before arrival, how far ahead guests can book, maximum stay, access type.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingBookingSettings200Response]
    def get_vrbo_listing_booking_settings(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_booking_settings_with_http_info(id, opts)
      data
    end

    # Get the Vrbo booking settings
    # Instant book or quote-and-hold, minimum nights, notice before arrival, how far ahead guests can book, maximum stay, access type.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingBookingSettings200Response, Integer, Hash)>] GetVrboListingBookingSettings200Response data, response status code and response headers
    def get_vrbo_listing_booking_settings_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_booking_settings ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_booking_settings"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/booking-settings'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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
    # The policy (Vrbo's named ones or custom refund windows), seasonal overrides, and the named policies Vrbo offers.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingCancellation200Response]
    def get_vrbo_listing_cancellation(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_cancellation_with_http_info(id, opts)
      data
    end

    # Get the Vrbo cancellation policy
    # The policy (Vrbo&#39;s named ones or custom refund windows), seasonal overrides, and the named policies Vrbo offers.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingCancellation200Response, Integer, Hash)>] GetVrboListingCancellation200Response data, response status code and response headers
    def get_vrbo_listing_cancellation_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_cancellation ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_cancellation"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/cancellation'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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

    # Get the Vrbo welcome guide
    # What guests receive before arrival: check-in and check-out instructions, driving and parking directions, access (type, code), wifi, per-amenity instructions, contacts.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingCheckinGuide200Response]
    def get_vrbo_listing_checkin_guide(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_checkin_guide_with_http_info(id, opts)
      data
    end

    # Get the Vrbo welcome guide
    # What guests receive before arrival: check-in and check-out instructions, driving and parking directions, access (type, code), wifi, per-amenity instructions, contacts.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingCheckinGuide200Response, Integer, Hash)>] GetVrboListingCheckinGuide200Response data, response status code and response headers
    def get_vrbo_listing_checkin_guide_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_checkin_guide ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_checkin_guide"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/checkin-guide'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingCheckinGuide200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_checkin_guide",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_checkin_guide\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo checkout guide
    # The checkout instructions guests get in Vrbo's welcome guide (`instructions`, `photos`). Written with PUT …/checkin-guide (`checkOut`), which holds the whole guide.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingCheckoutGuide200Response]
    def get_vrbo_listing_checkout_guide(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_checkout_guide_with_http_info(id, opts)
      data
    end

    # Get the Vrbo checkout guide
    # The checkout instructions guests get in Vrbo&#39;s welcome guide (&#x60;instructions&#x60;, &#x60;photos&#x60;). Written with PUT …/checkin-guide (&#x60;checkOut&#x60;), which holds the whole guide.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingCheckoutGuide200Response, Integer, Hash)>] GetVrboListingCheckoutGuide200Response data, response status code and response headers
    def get_vrbo_listing_checkout_guide_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_checkout_guide ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_checkout_guide"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/checkout-guide'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?
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
      return_type = opts[:debug_return_type] || 'GetVrboListingCheckoutGuide200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_checkout_guide",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_checkout_guide\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get several Vrbo listing sections
    # Read several sections of the listing's Vrbo listing in one call. `sections` is required: name them (`?sections=descriptions,house-rules,fees`) or ask for `all`. Each section is the `data` of its own endpoint.  Sections Repull holds answer from its copy; only the others are read on Vrbo, in one pass (`?source=live` reads them all on Vrbo: about 45 calls, **around 2.5 minutes** for `all`). A section Vrbo fails to return carries `{ error: { code, message } }`; the others still answer. `dataFreshness.lastSyncedAt` is the oldest section's.  Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param sections [String] Comma-separated sections, or &#x60;all&#x60;: descriptions, details, story, additional-info, photos, amenities, rooms, location, house-rules, booking-settings, cancellation, fees, pricing, payment-terms, protection, taxes, permits, checkin-guide, videos.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingContent200Response]
    def get_vrbo_listing_content(id, sections, opts = {})
      data, _status_code, _headers = get_vrbo_listing_content_with_http_info(id, sections, opts)
      data
    end

    # Get several Vrbo listing sections
    # Read several sections of the listing&#39;s Vrbo listing in one call. &#x60;sections&#x60; is required: name them (&#x60;?sections&#x3D;descriptions,house-rules,fees&#x60;) or ask for &#x60;all&#x60;. Each section is the &#x60;data&#x60; of its own endpoint.  Sections Repull holds answer from its copy; only the others are read on Vrbo, in one pass (&#x60;?source&#x3D;live&#x60; reads them all on Vrbo: about 45 calls, **around 2.5 minutes** for &#x60;all&#x60;). A section Vrbo fails to return carries &#x60;{ error: { code, message } }&#x60;; the others still answer. &#x60;dataFreshness.lastSyncedAt&#x60; is the oldest section&#39;s.  Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param sections [String] Comma-separated sections, or &#x60;all&#x60;: descriptions, details, story, additional-info, photos, amenities, rooms, location, house-rules, booking-settings, cancellation, fees, pricing, payment-terms, protection, taxes, permits, checkin-guide, videos.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
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
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/content'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'sections'] = sections
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?
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
    # The headline and description guests read: the listing's own language (`primary: true`, `locale: null`) and every language written for it by hand, which replaces Vrbo's automatic translation. `?locale=` returns one language.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds; a live read is 2 Vrbo calls plus 1 per language.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :locale Only this language (a code from &#x60;languages&#x60;).
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingDescriptions200Response]
    def get_vrbo_listing_descriptions(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_descriptions_with_http_info(id, opts)
      data
    end

    # Get the Vrbo headline and description
    # The headline and description guests read: the listing&#39;s own language (&#x60;primary: true&#x60;, &#x60;locale: null&#x60;) and every language written for it by hand, which replaces Vrbo&#39;s automatic translation. &#x60;?locale&#x3D;&#x60; returns one language.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds; a live read is 2 Vrbo calls plus 1 per language.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :locale Only this language (a code from &#x60;languages&#x60;).
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingDescriptions200Response, Integer, Hash)>] GetVrboListingDescriptions200Response data, response status code and response headers
    def get_vrbo_listing_descriptions_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_descriptions ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_descriptions"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/descriptions'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'locale'] = opts[:'locale'] if !opts[:'locale'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?
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
      return_type = opts[:debug_return_type] || 'GetVrboListingDescriptions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_descriptions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_descriptions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo property details
    # Property type (and the types Vrbo offers), internal name, interior size, seniors-only and long-term-renter flags.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingDetails200Response]
    def get_vrbo_listing_details(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_details_with_http_info(id, opts)
      data
    end

    # Get the Vrbo property details
    # Property type (and the types Vrbo offers), internal name, interior size, seniors-only and long-term-renter flags.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingDetails200Response, Integer, Hash)>] GetVrboListingDetails200Response data, response status code and response headers
    def get_vrbo_listing_details_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_details ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_details"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/details'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingDetails200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_details",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_details\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo fees
    # Cleaning, pet and extra-guest fees and custom fees, with their type (per stay / per night) and whether they are taxable.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingFees200Response]
    def get_vrbo_listing_fees(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_fees_with_http_info(id, opts)
      data
    end

    # Get the Vrbo fees
    # Cleaning, pet and extra-guest fees and custom fees, with their type (per stay / per night) and whether they are taxable.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingFees200Response, Integer, Hash)>] GetVrboListingFees200Response data, response status code and response headers
    def get_vrbo_listing_fees_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_fees ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_fees"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/fees'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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
    # Check-in/out times, maximum guests and adults, minimum age, children (with age bands), pets (count, weight), smoking (inside/outside), events (attendee cap), up to 3 custom rules, the rental agreement.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingHouseRules200Response]
    def get_vrbo_listing_house_rules(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_house_rules_with_http_info(id, opts)
      data
    end

    # Get the Vrbo house rules
    # Check-in/out times, maximum guests and adults, minimum age, children (with age bands), pets (count, weight), smoking (inside/outside), events (attendee cap), up to 3 custom rules, the rental agreement.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingHouseRules200Response, Integer, Hash)>] GetVrboListingHouseRules200Response data, response status code and response headers
    def get_vrbo_listing_house_rules_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_house_rules ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_house_rules"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/house-rules'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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
    # The address (read-only: Vrbo changes it only through its support) and whether guests see the exact location or an area.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingLocation200Response]
    def get_vrbo_listing_location(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_location_with_http_info(id, opts)
      data
    end

    # Get the Vrbo map setting
    # The address (read-only: Vrbo changes it only through its support) and whether guests see the exact location or an area.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingLocation200Response, Integer, Hash)>] GetVrboListingLocation200Response data, response status code and response headers
    def get_vrbo_listing_location_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_location ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_location"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/location'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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
    # How much the guest pays at booking and when the rest is due.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingPaymentTerms200Response]
    def get_vrbo_listing_payment_terms(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_payment_terms_with_http_info(id, opts)
      data
    end

    # Get the Vrbo payment terms
    # How much the guest pays at booking and when the rest is due.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingPaymentTerms200Response, Integer, Hash)>] GetVrboListingPaymentTerms200Response data, response status code and response headers
    def get_vrbo_listing_payment_terms_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_payment_terms ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_payment_terms"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/payment-terms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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

    # Get the Vrbo registration / licence
    # The local registration or licence fields Vrbo asks for in the listing's jurisdiction, and their status.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingPermits200Response]
    def get_vrbo_listing_permits(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_permits_with_http_info(id, opts)
      data
    end

    # Get the Vrbo registration / licence
    # The local registration or licence fields Vrbo asks for in the listing&#39;s jurisdiction, and their status.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingPermits200Response, Integer, Hash)>] GetVrboListingPermits200Response data, response status code and response headers
    def get_vrbo_listing_permits_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_permits ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_permits"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/permits'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboListingPermits200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_permits",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_permits\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo photos
    # Photos in order (id, url, caption, Vrbo's own tags, rank, rooms), plus any Vrbo moderation rejected and why.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingPhotos200Response]
    def get_vrbo_listing_photos(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_photos_with_http_info(id, opts)
      data
    end

    # Get the Vrbo photos
    # Photos in order (id, url, caption, Vrbo&#39;s own tags, rank, rooms), plus any Vrbo moderation rejected and why.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 2 Vrbo calls on Vrbo, spaced ~3 s apart per account — a few seconds.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
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
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/photos'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?
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
    # Base nightly rate per weekday, weekly and monthly discounts, default minimum stay, rate limits.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingPricing200Response]
    def get_vrbo_listing_pricing(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_pricing_with_http_info(id, opts)
      data
    end

    # Get the Vrbo base pricing
    # Base nightly rate per weekday, weekly and monthly discounts, default minimum stay, rate limits.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingPricing200Response, Integer, Hash)>] GetVrboListingPricing200Response data, response status code and response headers
    def get_vrbo_listing_pricing_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_pricing ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_pricing"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/pricing'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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

    # Get the Vrbo damage protection
    # Refundable damage deposit and damage protection.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingProtection200Response]
    def get_vrbo_listing_protection(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_protection_with_http_info(id, opts)
      data
    end

    # Get the Vrbo damage protection
    # Refundable damage deposit and damage protection.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingProtection200Response, Integer, Hash)>] GetVrboListingProtection200Response data, response status code and response headers
    def get_vrbo_listing_protection_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_protection ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_protection"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/protection'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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
    # Per night over a date range: the nightly rate, its weekday, the weekly (7–27 nights) and monthly (28+ nights) discounts and the minimum stay. Vrbo offers only these two stay discounts, saved per night with the weekday prices.  Read live from Vrbo on every request (a date range). **Cost:** 1 Vrbo calendar call (`?start=&end=`, default today + 13 days) on Vrbo, spaced ~3 s apart per account.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
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
    # Per night over a date range: the nightly rate, its weekday, the weekly (7–27 nights) and monthly (28+ nights) discounts and the minimum stay. Vrbo offers only these two stay discounts, saved per night with the weekday prices.  Read live from Vrbo on every request (a date range). **Cost:** 1 Vrbo calendar call (&#x60;?start&#x3D;&amp;end&#x3D;&#x60;, default today + 13 days) on Vrbo, spaced ~3 s apart per account.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
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

    # Get the Vrbo rooms
    # Bedrooms, bathrooms, living rooms and other spaces with their beds and room amenities; the space, bed and bathroom types Vrbo offers.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call + 1 per room on Vrbo, spaced ~3 s apart per account — a few seconds.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingRooms200Response]
    def get_vrbo_listing_rooms(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_rooms_with_http_info(id, opts)
      data
    end

    # Get the Vrbo rooms
    # Bedrooms, bathrooms, living rooms and other spaces with their beds and room amenities; the space, bed and bathroom types Vrbo offers.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call + 1 per room on Vrbo, spaced ~3 s apart per account — a few seconds.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
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
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/rooms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?
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

    # Get the Vrbo safety disclosures
    # What the listing tells guests about safety — the same path as Airbnb's safety disclosures. On Vrbo these are two amenity groups, field by field like GET …/amenities: `homeSafety` (smoke and carbon-monoxide detectors, fire extinguisher, deadbolt lock, exterior lighting, first-aid kit and where it is, emergency exit instructions, hospital and police contacts) and `safetyDevices` (smoke and carbon-monoxide detectors, gas-powered appliances). The detector questions are choices (`yes` / `no`, see each field's `options`).  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds; a live read is 2 Vrbo calls.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [GetVrboListingSafetyDisclosures200Response]
    def get_vrbo_listing_safety_disclosures(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_safety_disclosures_with_http_info(id, opts)
      data
    end

    # Get the Vrbo safety disclosures
    # What the listing tells guests about safety — the same path as Airbnb&#39;s safety disclosures. On Vrbo these are two amenity groups, field by field like GET …/amenities: &#x60;homeSafety&#x60; (smoke and carbon-monoxide detectors, fire extinguisher, deadbolt lock, exterior lighting, first-aid kit and where it is, emergency exit instructions, hospital and police contacts) and &#x60;safetyDevices&#x60; (smoke and carbon-monoxide detectors, gas-powered appliances). The detector questions are choices (&#x60;yes&#x60; / &#x60;no&#x60;, see each field&#39;s &#x60;options&#x60;).  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds; a live read is 2 Vrbo calls.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(GetVrboListingSafetyDisclosures200Response, Integer, Hash)>] GetVrboListingSafetyDisclosures200Response data, response status code and response headers
    def get_vrbo_listing_safety_disclosures_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_safety_disclosures ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_safety_disclosures"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/safety-disclosures'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?
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
      return_type = opts[:debug_return_type] || 'GetVrboListingSafetyDisclosures200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_listing_safety_disclosures",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_listing_safety_disclosures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the Vrbo host story
    # \"Your story\" on the listing: about you, why this property, what makes it unique.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingStory200Response]
    def get_vrbo_listing_story(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_story_with_http_info(id, opts)
      data
    end

    # Get the Vrbo host story
    # \&quot;Your story\&quot; on the listing: about you, why this property, what makes it unique.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingStory200Response, Integer, Hash)>] GetVrboListingStory200Response data, response status code and response headers
    def get_vrbo_listing_story_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_story ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_story"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/story'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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
    # Who collects tax and the rules that apply. Where Vrbo collects (e.g. British Columbia) the rules are read-only.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingTaxes200Response]
    def get_vrbo_listing_taxes(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_taxes_with_http_info(id, opts)
      data
    end

    # Get the Vrbo taxes
    # Who collects tax and the rules that apply. Where Vrbo collects (e.g. British Columbia) the rules are read-only.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingTaxes200Response, Integer, Hash)>] GetVrboListingTaxes200Response data, response status code and response headers
    def get_vrbo_listing_taxes_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_taxes ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_taxes"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/taxes'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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

    # Get the Vrbo videos
    # The listing's videos with their file name, Vrbo's processing and review status, player and thumbnail URLs, upload time and any reasons Vrbo rejected them.  Answers from Repull's stored copy of the listing's Vrbo content, like the Airbnb endpoints (`dataFreshness.lastSyncedAt` says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (`reason: refreshing`); every write through Repull stores what Vrbo has after it. `?source=live` reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns `404` when the listing is not linked to Vrbo, and `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [GetVrboListingVideos200Response]
    def get_vrbo_listing_videos(id, opts = {})
      data, _status_code, _headers = get_vrbo_listing_videos_with_http_info(id, opts)
      data
    end

    # Get the Vrbo videos
    # The listing&#39;s videos with their file name, Vrbo&#39;s processing and review status, player and thumbnail URLs, upload time and any reasons Vrbo rejected them.  Answers from Repull&#39;s stored copy of the listing&#39;s Vrbo content, like the Airbnb endpoints (&#x60;dataFreshness.lastSyncedAt&#x60; says when it was read from Vrbo). The first read of a section reads Vrbo and stores it; a copy over 24 h old answers and is refreshed in the background (&#x60;reason: refreshing&#x60;); every write through Repull stores what Vrbo has after it. &#x60;?source&#x3D;live&#x60; reads Vrbo now. **Cost:** from the copy, milliseconds. A live read is 1 Vrbo call on Vrbo, spaced ~3 s apart per account — a few seconds.  Works with messaging or full access. Returns &#x60;404&#x60; when the listing is not linked to Vrbo, and &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @option opts [String] :source &#x60;stored&#x60; (default): Repull&#39;s copy, in milliseconds. &#x60;live&#x60;: read Vrbo now (seconds) and refresh the copy. (default to 'stored')
    # @return [Array<(GetVrboListingVideos200Response, Integer, Hash)>] GetVrboListingVideos200Response data, response status code and response headers
    def get_vrbo_listing_videos_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_listing_videos ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.get_vrbo_listing_videos"
      end
      allowable_values = ["stored", "live"]
      if @api_client.config.client_side_validation && opts[:'source'] && !allowable_values.include?(opts[:'source'])
        fail ArgumentError, "invalid value for \"source\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/videos'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'vrboListingNumber'] = opts[:'vrbo_listing_number'] if !opts[:'vrbo_listing_number'].nil?
      query_params[:'source'] = opts[:'source'] if !opts[:'source'].nil?

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

    # Get a Vrbo reservation
    # A Vrbo booking by its confirmation code, as Vrbo shows it now — the counterpart of `GET /v1/channels/airbnb/reservations/{code}`: its state (`Booked`, a request, …), dates, party, the guest's charges (`guestLines`), your deductions and payout (`hostLines`, `payout`), the cancellation policy and the damage deposit, plus `availableActions` — what Vrbo's \"Change or cancel the booking\" menu offers right now.  `?options=cancel|change|decline` returns Vrbo's choices for that action instead: the cancel reasons and message limits; the booking's current dates, times and party with Vrbo's limits (e.g. a pay-later booking's check-in is locked); or the decline reasons of a booking request. Read live from Vrbo (a few seconds).
    # @param code [String] The Vrbo confirmation code (&#x60;HA-…&#x60;), as in &#x60;GET /v1/channels/vrbo/reservations&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :options Return Vrbo&#39;s choices for this action instead of the booking.
    # @return [GetVrboReservation200Response]
    def get_vrbo_reservation(code, opts = {})
      data, _status_code, _headers = get_vrbo_reservation_with_http_info(code, opts)
      data
    end

    # Get a Vrbo reservation
    # A Vrbo booking by its confirmation code, as Vrbo shows it now — the counterpart of &#x60;GET /v1/channels/airbnb/reservations/{code}&#x60;: its state (&#x60;Booked&#x60;, a request, …), dates, party, the guest&#39;s charges (&#x60;guestLines&#x60;), your deductions and payout (&#x60;hostLines&#x60;, &#x60;payout&#x60;), the cancellation policy and the damage deposit, plus &#x60;availableActions&#x60; — what Vrbo&#39;s \&quot;Change or cancel the booking\&quot; menu offers right now.  &#x60;?options&#x3D;cancel|change|decline&#x60; returns Vrbo&#39;s choices for that action instead: the cancel reasons and message limits; the booking&#39;s current dates, times and party with Vrbo&#39;s limits (e.g. a pay-later booking&#39;s check-in is locked); or the decline reasons of a booking request. Read live from Vrbo (a few seconds).
    # @param code [String] The Vrbo confirmation code (&#x60;HA-…&#x60;), as in &#x60;GET /v1/channels/vrbo/reservations&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :options Return Vrbo&#39;s choices for this action instead of the booking.
    # @return [Array<(GetVrboReservation200Response, Integer, Hash)>] GetVrboReservation200Response data, response status code and response headers
    def get_vrbo_reservation_with_http_info(code, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.get_vrbo_reservation ...'
      end
      # verify the required parameter 'code' is set
      if @api_client.config.client_side_validation && code.nil?
        fail ArgumentError, "Missing the required parameter 'code' when calling VRBOApi.get_vrbo_reservation"
      end
      allowable_values = ["cancel", "change", "decline"]
      if @api_client.config.client_side_validation && opts[:'options'] && !allowable_values.include?(opts[:'options'])
        fail ArgumentError, "invalid value for \"options\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/reservations/{code}'.sub('{code}', CGI.escape(code.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'options'] = opts[:'options'] if !opts[:'options'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetVrboReservation200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.get_vrbo_reservation",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#get_vrbo_reservation\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
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

    # List Vrbo transactions (payout ledger)
    # The Vrbo payout ledger for this workspace — the counterpart of `GET /v1/channels/airbnb/transactions`: every bank deposit Vrbo made to the host, each followed by the bookings it paid. A deposit's lines' signed `amount`s sum to its `payout.paidOutAmount` exactly; a negative line (`type: Adjustment`) is money taken back from that deposit. `status: UPCOMING` lines are payouts Vrbo has scheduled and not made yet, with Vrbo's `upcomingStatus` (`Scheduled`, `Blocked`).  **Ids are stable**, so you can upsert on `transactionId`: a Payout row's id is Vrbo's deposit reference number; a line's is `<reference>:<confirmationCode>:<n>`.  **Order:** newest deposit first, each followed by its lines in Vrbo's order (`payout.lineIndex`). `start_date` / `end_date` match the deposit's date (a scheduled line's estimated payout date).  **From Repull's copy.** The ledger is read from the Vrbo account (the last 12 months of deposits, and the payouts scheduled for the next 6) and kept: a read answers from it at once. A copy over a day old — or never filled — answers and is refreshed in the background (`dataFreshness.reason`: `refreshing` / `never_synced`); `POST` refreshes it now.  Lines on listings that are inactive in Repull are included and flagged `onInactiveListing: true`, so every deposit reconciles. **Not in Vrbo's payout reports** (`unavailableFields`): the fee split per booking, taxes, and the stay's nights and dates — see the reservation for those.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :account_id Only this Vrbo account (&#x60;accountId&#x60; from &#x60;GET /v1/channels/vrbo/connection&#x60;).
    # @option opts [Date] :start_date Inclusive lower bound on the deposit&#39;s date. YYYY-MM-DD.
    # @option opts [Date] :end_date Inclusive upper bound on the deposit&#39;s date. YYYY-MM-DD.
    # @option opts [String] :status 
    # @option opts [String] :type &#x60;Payout&#x60;, &#x60;Reservation&#x60; or &#x60;Adjustment&#x60;.
    # @option opts [String] :payout_id One deposit (its reference number) and its lines.
    # @option opts [String] :confirmation_code 
    # @option opts [String] :cursor From the previous page&#39;s &#x60;pagination.nextCursor&#x60;.
    # @option opts [Integer] :limit Rows per page (default 100, at most 500). (default to 100)
    # @return [ListVrboTransactions200Response]
    def list_vrbo_transactions(opts = {})
      data, _status_code, _headers = list_vrbo_transactions_with_http_info(opts)
      data
    end

    # List Vrbo transactions (payout ledger)
    # The Vrbo payout ledger for this workspace — the counterpart of &#x60;GET /v1/channels/airbnb/transactions&#x60;: every bank deposit Vrbo made to the host, each followed by the bookings it paid. A deposit&#39;s lines&#39; signed &#x60;amount&#x60;s sum to its &#x60;payout.paidOutAmount&#x60; exactly; a negative line (&#x60;type: Adjustment&#x60;) is money taken back from that deposit. &#x60;status: UPCOMING&#x60; lines are payouts Vrbo has scheduled and not made yet, with Vrbo&#39;s &#x60;upcomingStatus&#x60; (&#x60;Scheduled&#x60;, &#x60;Blocked&#x60;).  **Ids are stable**, so you can upsert on &#x60;transactionId&#x60;: a Payout row&#39;s id is Vrbo&#39;s deposit reference number; a line&#39;s is &#x60;&lt;reference&gt;:&lt;confirmationCode&gt;:&lt;n&gt;&#x60;.  **Order:** newest deposit first, each followed by its lines in Vrbo&#39;s order (&#x60;payout.lineIndex&#x60;). &#x60;start_date&#x60; / &#x60;end_date&#x60; match the deposit&#39;s date (a scheduled line&#39;s estimated payout date).  **From Repull&#39;s copy.** The ledger is read from the Vrbo account (the last 12 months of deposits, and the payouts scheduled for the next 6) and kept: a read answers from it at once. A copy over a day old — or never filled — answers and is refreshed in the background (&#x60;dataFreshness.reason&#x60;: &#x60;refreshing&#x60; / &#x60;never_synced&#x60;); &#x60;POST&#x60; refreshes it now.  Lines on listings that are inactive in Repull are included and flagged &#x60;onInactiveListing: true&#x60;, so every deposit reconciles. **Not in Vrbo&#39;s payout reports** (&#x60;unavailableFields&#x60;): the fee split per booking, taxes, and the stay&#39;s nights and dates — see the reservation for those.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :account_id Only this Vrbo account (&#x60;accountId&#x60; from &#x60;GET /v1/channels/vrbo/connection&#x60;).
    # @option opts [Date] :start_date Inclusive lower bound on the deposit&#39;s date. YYYY-MM-DD.
    # @option opts [Date] :end_date Inclusive upper bound on the deposit&#39;s date. YYYY-MM-DD.
    # @option opts [String] :status 
    # @option opts [String] :type &#x60;Payout&#x60;, &#x60;Reservation&#x60; or &#x60;Adjustment&#x60;.
    # @option opts [String] :payout_id One deposit (its reference number) and its lines.
    # @option opts [String] :confirmation_code 
    # @option opts [String] :cursor From the previous page&#39;s &#x60;pagination.nextCursor&#x60;.
    # @option opts [Integer] :limit Rows per page (default 100, at most 500). (default to 100)
    # @return [Array<(ListVrboTransactions200Response, Integer, Hash)>] ListVrboTransactions200Response data, response status code and response headers
    def list_vrbo_transactions_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.list_vrbo_transactions ...'
      end
      allowable_values = ["COMPLETED", "UPCOMING"]
      if @api_client.config.client_side_validation && opts[:'status'] && !allowable_values.include?(opts[:'status'])
        fail ArgumentError, "invalid value for \"status\", must be one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 500
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling VRBOApi.list_vrbo_transactions, must be smaller than or equal to 500.'
      end

      # resource path
      local_var_path = '/v1/channels/vrbo/transactions'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'account_id'] = opts[:'account_id'] if !opts[:'account_id'].nil?
      query_params[:'start_date'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'end_date'] = opts[:'end_date'] if !opts[:'end_date'].nil?
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?
      query_params[:'payout_id'] = opts[:'payout_id'] if !opts[:'payout_id'].nil?
      query_params[:'confirmation_code'] = opts[:'confirmation_code'] if !opts[:'confirmation_code'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListVrboTransactions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.list_vrbo_transactions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#list_vrbo_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Link a Vrbo listing to a Repull listing
    # Link a Vrbo unit that is already on the host's connected Vrbo account to a Repull listing — the Vrbo counterpart of `POST /v1/channels/airbnb/listings/map`. Send `listingId` to link it to that listing, or `create: true` to create a Repull listing from what Vrbo shows. Once linked, the unit's bookings and messages are imported (upcoming ones and the last 30 days first).  `accountId` names the Vrbo account when the workspace has several (`GET /v1/connect/vrbo-login`). `syncEnabled: true` also sends the listing's calendar to Vrbo (full access; refused with `409 calendar_managed_elsewhere` while another tool manages the account's calendar).  The same write as `POST /v1/connections/{id}/mappings`, for one unit.
    # @param map_vrbo_listing_request [MapVrboListingRequest] 
    # @param [Hash] opts the optional parameters
    # @return [MapVrboListing200Response]
    def map_vrbo_listing(map_vrbo_listing_request, opts = {})
      data, _status_code, _headers = map_vrbo_listing_with_http_info(map_vrbo_listing_request, opts)
      data
    end

    # Link a Vrbo listing to a Repull listing
    # Link a Vrbo unit that is already on the host&#39;s connected Vrbo account to a Repull listing — the Vrbo counterpart of &#x60;POST /v1/channels/airbnb/listings/map&#x60;. Send &#x60;listingId&#x60; to link it to that listing, or &#x60;create: true&#x60; to create a Repull listing from what Vrbo shows. Once linked, the unit&#39;s bookings and messages are imported (upcoming ones and the last 30 days first).  &#x60;accountId&#x60; names the Vrbo account when the workspace has several (&#x60;GET /v1/connect/vrbo-login&#x60;). &#x60;syncEnabled: true&#x60; also sends the listing&#39;s calendar to Vrbo (full access; refused with &#x60;409 calendar_managed_elsewhere&#x60; while another tool manages the account&#39;s calendar).  The same write as &#x60;POST /v1/connections/{id}/mappings&#x60;, for one unit.
    # @param map_vrbo_listing_request [MapVrboListingRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(MapVrboListing200Response, Integer, Hash)>] MapVrboListing200Response data, response status code and response headers
    def map_vrbo_listing_with_http_info(map_vrbo_listing_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.map_vrbo_listing ...'
      end
      # verify the required parameter 'map_vrbo_listing_request' is set
      if @api_client.config.client_side_validation && map_vrbo_listing_request.nil?
        fail ArgumentError, "Missing the required parameter 'map_vrbo_listing_request' when calling VRBOApi.map_vrbo_listing"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/map'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(map_vrbo_listing_request)

      # return_type
      return_type = opts[:debug_return_type] || 'MapVrboListing200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.map_vrbo_listing",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#map_vrbo_listing\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reorder the Vrbo photos
    # Put the photos in this order, first photo first. Photos left out keep their order after the ones sent. Photo ids are the `id`s of GET …/photos.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param reorder_vrbo_listing_photos_request [ReorderVrboListingPhotosRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [AddVrboListingPhotos200Response]
    def reorder_vrbo_listing_photos(id, reorder_vrbo_listing_photos_request, opts = {})
      data, _status_code, _headers = reorder_vrbo_listing_photos_with_http_info(id, reorder_vrbo_listing_photos_request, opts)
      data
    end

    # Reorder the Vrbo photos
    # Put the photos in this order, first photo first. Photos left out keep their order after the ones sent. Photo ids are the &#x60;id&#x60;s of GET …/photos.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param reorder_vrbo_listing_photos_request [ReorderVrboListingPhotosRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(AddVrboListingPhotos200Response, Integer, Hash)>] AddVrboListingPhotos200Response data, response status code and response headers
    def reorder_vrbo_listing_photos_with_http_info(id, reorder_vrbo_listing_photos_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.reorder_vrbo_listing_photos ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.reorder_vrbo_listing_photos"
      end
      # verify the required parameter 'reorder_vrbo_listing_photos_request' is set
      if @api_client.config.client_side_validation && reorder_vrbo_listing_photos_request.nil?
        fail ArgumentError, "Missing the required parameter 'reorder_vrbo_listing_photos_request' when calling VRBOApi.reorder_vrbo_listing_photos"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/photos/order'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(reorder_vrbo_listing_photos_request)

      # return_type
      return_type = opts[:debug_return_type] || 'AddVrboListingPhotos200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.reorder_vrbo_listing_photos",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#reorder_vrbo_listing_photos\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Set the Vrbo cover photo
    # Make one photo the first, the one guests see in search. Photo ids are the `id`s of GET …/photos.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param set_vrbo_listing_cover_photo_request [SetVrboListingCoverPhotoRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [AddVrboListingPhotos200Response]
    def set_vrbo_listing_cover_photo(id, set_vrbo_listing_cover_photo_request, opts = {})
      data, _status_code, _headers = set_vrbo_listing_cover_photo_with_http_info(id, set_vrbo_listing_cover_photo_request, opts)
      data
    end

    # Set the Vrbo cover photo
    # Make one photo the first, the one guests see in search. Photo ids are the &#x60;id&#x60;s of GET …/photos.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param set_vrbo_listing_cover_photo_request [SetVrboListingCoverPhotoRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(AddVrboListingPhotos200Response, Integer, Hash)>] AddVrboListingPhotos200Response data, response status code and response headers
    def set_vrbo_listing_cover_photo_with_http_info(id, set_vrbo_listing_cover_photo_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.set_vrbo_listing_cover_photo ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.set_vrbo_listing_cover_photo"
      end
      # verify the required parameter 'set_vrbo_listing_cover_photo_request' is set
      if @api_client.config.client_side_validation && set_vrbo_listing_cover_photo_request.nil?
        fail ArgumentError, "Missing the required parameter 'set_vrbo_listing_cover_photo_request' when calling VRBOApi.set_vrbo_listing_cover_photo"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/photos/cover'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(set_vrbo_listing_cover_photo_request)

      # return_type
      return_type = opts[:debug_return_type] || 'AddVrboListingPhotos200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.set_vrbo_listing_cover_photo",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#set_vrbo_listing_cover_photo\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Refresh the Vrbo payout ledger
    # Read the ledger from Vrbo now — every connected Vrbo account, or the one in `?account_id=` — and keep it; then read it with GET. Body (optional): `start_date` / `end_date` (YYYY-MM-DD) for the deposits to read; without them, the last 12 months. The payouts Vrbo has scheduled are always read again. One account failing never stops the others: it carries `error` in `accounts[]`. About 15 seconds per account.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :account_id Only this Vrbo account (&#x60;accountId&#x60; from &#x60;GET /v1/channels/vrbo/connection&#x60;).
    # @option opts [SyncVrboTransactionsRequest] :sync_vrbo_transactions_request 
    # @return [SyncVrboTransactions200Response]
    def sync_vrbo_transactions(opts = {})
      data, _status_code, _headers = sync_vrbo_transactions_with_http_info(opts)
      data
    end

    # Refresh the Vrbo payout ledger
    # Read the ledger from Vrbo now — every connected Vrbo account, or the one in &#x60;?account_id&#x3D;&#x60; — and keep it; then read it with GET. Body (optional): &#x60;start_date&#x60; / &#x60;end_date&#x60; (YYYY-MM-DD) for the deposits to read; without them, the last 12 months. The payouts Vrbo has scheduled are always read again. One account failing never stops the others: it carries &#x60;error&#x60; in &#x60;accounts[]&#x60;. About 15 seconds per account.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :account_id Only this Vrbo account (&#x60;accountId&#x60; from &#x60;GET /v1/channels/vrbo/connection&#x60;).
    # @option opts [SyncVrboTransactionsRequest] :sync_vrbo_transactions_request 
    # @return [Array<(SyncVrboTransactions200Response, Integer, Hash)>] SyncVrboTransactions200Response data, response status code and response headers
    def sync_vrbo_transactions_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.sync_vrbo_transactions ...'
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/transactions'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'account_id'] = opts[:'account_id'] if !opts[:'account_id'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'sync_vrbo_transactions_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'SyncVrboTransactions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.sync_vrbo_transactions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#sync_vrbo_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo additional details
    # Change the additional details of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `property`, `bedrooms`, `bathrooms`.  **Cost:** 1 call + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the additional details of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;property&#x60;, &#x60;bedrooms&#x60;, &#x60;bathrooms&#x60;.  **Cost:** 1 call + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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
    # Change the amenities of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `groups: {<group>: {values: {<field id>: value}}}`. Checkbox `true`/`false`; choice one of the field's `options`; text and numbers as such. Setting a parent to \"no\" clears its children, as Vrbo's own form does.  **Cost:** 1 call per group written + the read back of those groups on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the amenities of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;groups: {&lt;group&gt;: {values: {&lt;field id&gt;: value}}}&#x60;. Checkbox &#x60;true&#x60;/&#x60;false&#x60;; choice one of the field&#39;s &#x60;options&#x60;; text and numbers as such. Setting a parent to \&quot;no\&quot; clears its children, as Vrbo&#39;s own form does.  **Cost:** 1 call per group written + the read back of those groups on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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

    # Update the Vrbo calendar
    # Write nights to Vrbo only — the counterpart of `PUT /v1/channels/airbnb/listings/{id}/availability` with `type: \"calendar\"`, with its operation fields: `daily_price`, `availability`, `min_nights`, `closed_to_arrival`, `closed_to_departure`.  The writes are queued with the account's other Vrbo calendar writes, which Vrbo takes at a pace of its own, so this answers `202` with a `jobId`: read its status with `GET …/availability?jobId=`. The listing's own calendar is not changed, and its next push for the same nights puts its own values back (as on Airbnb). For a change on every channel use `PUT /v1/availability/{propertyId}`.  Listing-level stay rules (default minimum stay, notice, booking window) are Vrbo's booking settings: `PUT /v1/channels/vrbo/listings/{id}/booking-settings` (`type: \"rules\"` is refused with that pointer). Nights up to 730 days ahead. Needs full access (`403 vrbo_messaging_access`); `409 calendar_managed_elsewhere` while another tool manages the account's calendar on Vrbo.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_availability_request [UpdateVrboListingAvailabilityRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingAvailability202Response]
    def update_vrbo_listing_availability(id, update_vrbo_listing_availability_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_availability_with_http_info(id, update_vrbo_listing_availability_request, opts)
      data
    end

    # Update the Vrbo calendar
    # Write nights to Vrbo only — the counterpart of &#x60;PUT /v1/channels/airbnb/listings/{id}/availability&#x60; with &#x60;type: \&quot;calendar\&quot;&#x60;, with its operation fields: &#x60;daily_price&#x60;, &#x60;availability&#x60;, &#x60;min_nights&#x60;, &#x60;closed_to_arrival&#x60;, &#x60;closed_to_departure&#x60;.  The writes are queued with the account&#39;s other Vrbo calendar writes, which Vrbo takes at a pace of its own, so this answers &#x60;202&#x60; with a &#x60;jobId&#x60;: read its status with &#x60;GET …/availability?jobId&#x3D;&#x60;. The listing&#39;s own calendar is not changed, and its next push for the same nights puts its own values back (as on Airbnb). For a change on every channel use &#x60;PUT /v1/availability/{propertyId}&#x60;.  Listing-level stay rules (default minimum stay, notice, booking window) are Vrbo&#39;s booking settings: &#x60;PUT /v1/channels/vrbo/listings/{id}/booking-settings&#x60; (&#x60;type: \&quot;rules\&quot;&#x60; is refused with that pointer). Nights up to 730 days ahead. Needs full access (&#x60;403 vrbo_messaging_access&#x60;); &#x60;409 calendar_managed_elsewhere&#x60; while another tool manages the account&#39;s calendar on Vrbo.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_availability_request [UpdateVrboListingAvailabilityRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingAvailability202Response, Integer, Hash)>] UpdateVrboListingAvailability202Response data, response status code and response headers
    def update_vrbo_listing_availability_with_http_info(id, update_vrbo_listing_availability_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_availability ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_availability"
      end
      # verify the required parameter 'update_vrbo_listing_availability_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_availability_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_availability_request' when calling VRBOApi.update_vrbo_listing_availability"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/availability'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_availability_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingAvailability202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_availability",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_availability\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo booking settings
    # Change the booking settings of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `bookingType` (`INSTANT`|`QUOTEHOLD`), `minNights`, `minDaysBeforeBooking`, `maxMonthsBeforeBooking` (6, 9, 12, 18 or 24), `maxLengthOfStay`, `accessType`. Values must be ones the read lists. None of these can be cleared once set — **including `accessType`**: Vrbo keeps the last access type, so it can be changed to another but not removed.  **Cost:** 1–3 calls + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the booking settings of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;bookingType&#x60; (&#x60;INSTANT&#x60;|&#x60;QUOTEHOLD&#x60;), &#x60;minNights&#x60;, &#x60;minDaysBeforeBooking&#x60;, &#x60;maxMonthsBeforeBooking&#x60; (6, 9, 12, 18 or 24), &#x60;maxLengthOfStay&#x60;, &#x60;accessType&#x60;. Values must be ones the read lists. None of these can be cleared once set — **including &#x60;accessType&#x60;**: Vrbo keeps the last access type, so it can be changed to another but not removed.  **Cost:** 1–3 calls + 2 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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
    # Change the cancellation policy of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `policyType` (e.g. `POLICY_TYPE_VR_RELAXED`, `_MODERATE`, `_FIRM`, `_STRICT`, or `POLICY_TYPE_CUSTOM` with `tiers: [{daysBefore, refundPercent}]`). Seasonal overrides are kept.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the cancellation policy of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;policyType&#x60; (e.g. &#x60;POLICY_TYPE_VR_RELAXED&#x60;, &#x60;_MODERATE&#x60;, &#x60;_FIRM&#x60;, &#x60;_STRICT&#x60;, or &#x60;POLICY_TYPE_CUSTOM&#x60; with &#x60;tiers: [{daysBefore, refundPercent}]&#x60;). Seasonal overrides are kept.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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

    # Update the Vrbo welcome guide
    # Change the welcome guide of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `checkIn`, `checkOut`, `drivingDirections`, `parkingDirections` (`{instructions}`), `wifi`, `access`, `amenities` (`{AMENITY_ID: {instructions}}`). **The notes are one-way:** Vrbo has not been shown to remove a note once added, so `null` and empty text are refused — change a note to other text instead.  **Cost:** 1–2 calls per item + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_checkin_guide_request [UpdateVrboListingCheckinGuideRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingCheckinGuide200Response]
    def update_vrbo_listing_checkin_guide(id, update_vrbo_listing_checkin_guide_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_checkin_guide_with_http_info(id, update_vrbo_listing_checkin_guide_request, opts)
      data
    end

    # Update the Vrbo welcome guide
    # Change the welcome guide of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;checkIn&#x60;, &#x60;checkOut&#x60;, &#x60;drivingDirections&#x60;, &#x60;parkingDirections&#x60; (&#x60;{instructions}&#x60;), &#x60;wifi&#x60;, &#x60;access&#x60;, &#x60;amenities&#x60; (&#x60;{AMENITY_ID: {instructions}}&#x60;). **The notes are one-way:** Vrbo has not been shown to remove a note once added, so &#x60;null&#x60; and empty text are refused — change a note to other text instead.  **Cost:** 1–2 calls per item + the read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_checkin_guide_request [UpdateVrboListingCheckinGuideRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingCheckinGuide200Response, Integer, Hash)>] UpdateVrboListingCheckinGuide200Response data, response status code and response headers
    def update_vrbo_listing_checkin_guide_with_http_info(id, update_vrbo_listing_checkin_guide_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_checkin_guide ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_checkin_guide"
      end
      # verify the required parameter 'update_vrbo_listing_checkin_guide_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_checkin_guide_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_checkin_guide_request' when calling VRBOApi.update_vrbo_listing_checkin_guide"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/checkin-guide'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_checkin_guide_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingCheckinGuide200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_checkin_guide",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_checkin_guide\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo headline and description
    # Change the headline and/or description. Without `locale` this is the listing's own language; with `locale` (one of `languages`) it writes that language's translation by hand — a field left out keeps the text Vrbo has for it. Vrbo refuses some characters and words (`( ) * $ €`, other platforms' names, \"covid\") and says which.  The answer is every language, as GET returns it.  **Cost:** 1 Vrbo call + 1 to read back (a translation with one field: +1 to read the other).  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_descriptions_request [UpdateVrboListingDescriptionsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingDescriptions200Response]
    def update_vrbo_listing_descriptions(id, update_vrbo_listing_descriptions_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_descriptions_with_http_info(id, update_vrbo_listing_descriptions_request, opts)
      data
    end

    # Update the Vrbo headline and description
    # Change the headline and/or description. Without &#x60;locale&#x60; this is the listing&#39;s own language; with &#x60;locale&#x60; (one of &#x60;languages&#x60;) it writes that language&#39;s translation by hand — a field left out keeps the text Vrbo has for it. Vrbo refuses some characters and words (&#x60;( ) * $ €&#x60;, other platforms&#39; names, \&quot;covid\&quot;) and says which.  The answer is every language, as GET returns it.  **Cost:** 1 Vrbo call + 1 to read back (a translation with one field: +1 to read the other).  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_descriptions_request [UpdateVrboListingDescriptionsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingDescriptions200Response, Integer, Hash)>] UpdateVrboListingDescriptions200Response data, response status code and response headers
    def update_vrbo_listing_descriptions_with_http_info(id, update_vrbo_listing_descriptions_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_descriptions ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_descriptions"
      end
      # verify the required parameter 'update_vrbo_listing_descriptions_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_descriptions_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_descriptions_request' when calling VRBOApi.update_vrbo_listing_descriptions"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/descriptions'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_descriptions_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingDescriptions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_descriptions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_descriptions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo property details
    # Change the property details of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `propertyType` (one of `propertyTypeOptions`), `propertyName`, `interiorSize` `{value, unit: sqft|sqm}`, `seniorsOnly`, `longTermRentersWelcome`. `propertyType` and `propertyName` can be changed but not cleared.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_details_request [UpdateVrboListingDetailsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingDetails200Response]
    def update_vrbo_listing_details(id, update_vrbo_listing_details_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_details_with_http_info(id, update_vrbo_listing_details_request, opts)
      data
    end

    # Update the Vrbo property details
    # Change the property details of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;propertyType&#x60; (one of &#x60;propertyTypeOptions&#x60;), &#x60;propertyName&#x60;, &#x60;interiorSize&#x60; &#x60;{value, unit: sqft|sqm}&#x60;, &#x60;seniorsOnly&#x60;, &#x60;longTermRentersWelcome&#x60;. &#x60;propertyType&#x60; and &#x60;propertyName&#x60; can be changed but not cleared.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_details_request [UpdateVrboListingDetailsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingDetails200Response, Integer, Hash)>] UpdateVrboListingDetails200Response data, response status code and response headers
    def update_vrbo_listing_details_with_http_info(id, update_vrbo_listing_details_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_details ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_details"
      end
      # verify the required parameter 'update_vrbo_listing_details_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_details_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_details_request' when calling VRBOApi.update_vrbo_listing_details"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/details'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_details_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingDetails200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_details",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_details\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo fees
    # Change the fees of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `cleaning`, `pets`, `extraGuests`, `custom`. `null` clears a fee; `custom` replaces the custom-fee list (`[]` removes them all), each `{productCode, amount, type?, taxable?, taxRate?}` with `productCode` one of the read's `customFeeCodes`.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the fees of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;cleaning&#x60;, &#x60;pets&#x60;, &#x60;extraGuests&#x60;, &#x60;custom&#x60;. &#x60;null&#x60; clears a fee; &#x60;custom&#x60; replaces the custom-fee list (&#x60;[]&#x60; removes them all), each &#x60;{productCode, amount, type?, taxable?, taxRate?}&#x60; with &#x60;productCode&#x60; one of the read&#39;s &#x60;customFeeCodes&#x60;.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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
    # Change the house rules of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `checkInTime`/`checkOutTime` (`Flexible` or `HH:MM` on the half hour), `maxGuests`, `maxAdults`, `occupancyNote`, `minimumAge`, `minimumAgeNote`, `children`, `pets`, `smoking`, `events`, `customRules` (at most 3). `maxAdults` may not exceed `maxGuests`: when lowering `maxGuests`, send `maxAdults` with it. `maxGuests` cannot be cleared; `minimumAge: null` removes the minimum age.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the house rules of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;checkInTime&#x60;/&#x60;checkOutTime&#x60; (&#x60;Flexible&#x60; or &#x60;HH:MM&#x60; on the half hour), &#x60;maxGuests&#x60;, &#x60;maxAdults&#x60;, &#x60;occupancyNote&#x60;, &#x60;minimumAge&#x60;, &#x60;minimumAgeNote&#x60;, &#x60;children&#x60;, &#x60;pets&#x60;, &#x60;smoking&#x60;, &#x60;events&#x60;, &#x60;customRules&#x60; (at most 3). &#x60;maxAdults&#x60; may not exceed &#x60;maxGuests&#x60;: when lowering &#x60;maxGuests&#x60;, send &#x60;maxAdults&#x60; with it. &#x60;maxGuests&#x60; cannot be cleared; &#x60;minimumAge: null&#x60; removes the minimum age.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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
    # Change the map setting of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `showExactLocation: true|false`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the map setting of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;showExactLocation: true|false&#x60;.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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
    # Change the payment terms of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `percentDueNow` and `payments: [{percent, daysBeforeArrival}]`, adding up to 100.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the payment terms of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;percentDueNow&#x60; and &#x60;payments: [{percent, daysBeforeArrival}]&#x60;, adding up to 100.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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

    # Update the Vrbo registration / licence
    # Change the registration / licence of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `settings: [{name, value}]` with the `name`s the read lists (they differ per city). Vrbo checks them against the registry.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_permits_request [UpdateVrboListingPermitsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingPermits200Response]
    def update_vrbo_listing_permits(id, update_vrbo_listing_permits_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_permits_with_http_info(id, update_vrbo_listing_permits_request, opts)
      data
    end

    # Update the Vrbo registration / licence
    # Change the registration / licence of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;settings: [{name, value}]&#x60; with the &#x60;name&#x60;s the read lists (they differ per city). Vrbo checks them against the registry.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_permits_request [UpdateVrboListingPermitsRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingPermits200Response, Integer, Hash)>] UpdateVrboListingPermits200Response data, response status code and response headers
    def update_vrbo_listing_permits_with_http_info(id, update_vrbo_listing_permits_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_permits ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_permits"
      end
      # verify the required parameter 'update_vrbo_listing_permits_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_permits_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_permits_request' when calling VRBOApi.update_vrbo_listing_permits"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/permits'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_permits_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingPermits200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_permits",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_permits\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update a Vrbo photo
    # Change one photo's `caption` and/or its position (`sort_order`, 1 = first). Photo ids are the `id`s of GET …/photos. Vrbo cannot clear a caption once set.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_photo_request [UpdateVrboListingPhotoRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [AddVrboListingPhotos200Response]
    def update_vrbo_listing_photo(id, update_vrbo_listing_photo_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_photo_with_http_info(id, update_vrbo_listing_photo_request, opts)
      data
    end

    # Update a Vrbo photo
    # Change one photo&#39;s &#x60;caption&#x60; and/or its position (&#x60;sort_order&#x60;, 1 &#x3D; first). Photo ids are the &#x60;id&#x60;s of GET …/photos. Vrbo cannot clear a caption once set.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_photo_request [UpdateVrboListingPhotoRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(AddVrboListingPhotos200Response, Integer, Hash)>] AddVrboListingPhotos200Response data, response status code and response headers
    def update_vrbo_listing_photo_with_http_info(id, update_vrbo_listing_photo_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_photo ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_photo"
      end
      # verify the required parameter 'update_vrbo_listing_photo_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_photo_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_photo_request' when calling VRBOApi.update_vrbo_listing_photo"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_photo_request)

      # return_type
      return_type = opts[:debug_return_type] || 'AddVrboListingPhotos200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_photo",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_photo\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo base pricing
    # Change the base pricing of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `baseRate`. The answer comes once Vrbo shows the new rate. Nightly prices per date come from the listing calendar (`PUT /v1/availability/{propertyId}`), which Vrbo shows over the base rate. Uses Vrbo's calendar quota: while the listing's calendar push is writing, the answer is `409 vrbo_calendar_busy` with `retry_after` and nothing is changed.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the base pricing of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;baseRate&#x60;. The answer comes once Vrbo shows the new rate. Nightly prices per date come from the listing calendar (&#x60;PUT /v1/availability/{propertyId}&#x60;), which Vrbo shows over the base rate. Uses Vrbo&#39;s calendar quota: while the listing&#39;s calendar push is writing, the answer is &#x60;409 vrbo_calendar_busy&#x60; with &#x60;retry_after&#x60; and nothing is changed.  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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

    # Update the Vrbo damage protection
    # Change the damage protection of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `damageDeposit` (`{amount}` or `null`), `damageProtection`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the damage protection of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;damageDeposit&#x60; (&#x60;{amount}&#x60; or &#x60;null&#x60;), &#x60;damageProtection&#x60;.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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
    # Change the rates and stay discounts of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `startDate`, `endDate` (at most 3 years) and any of `nightlyRate` (one price), `nightlyRates` (`{sunday…saturday}`), `weeklyDiscountPercent`, `monthlyDiscountPercent` (0–99). A discount-only write keeps the current prices when each weekday has one price in the range; otherwise send `nightlyRates`. Nightly prices belong to the listing calendar (`PUT /v1/availability/{propertyId}`), whose push to Vrbo may put back a price set here; use this for the discounts and for prices on nights the calendar does not manage. While the listing's calendar push is writing, the answer is `409 vrbo_calendar_busy` with `retry_after` and nothing is changed.  **Cost:** 1–2 calendar calls + 1 to read back (Vrbo's calendar quota, the one price pushes use) on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the rates and stay discounts of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;startDate&#x60;, &#x60;endDate&#x60; (at most 3 years) and any of &#x60;nightlyRate&#x60; (one price), &#x60;nightlyRates&#x60; (&#x60;{sunday…saturday}&#x60;), &#x60;weeklyDiscountPercent&#x60;, &#x60;monthlyDiscountPercent&#x60; (0–99). A discount-only write keeps the current prices when each weekday has one price in the range; otherwise send &#x60;nightlyRates&#x60;. Nightly prices belong to the listing calendar (&#x60;PUT /v1/availability/{propertyId}&#x60;), whose push to Vrbo may put back a price set here; use this for the discounts and for prices on nights the calendar does not manage. While the listing&#39;s calendar push is writing, the answer is &#x60;409 vrbo_calendar_busy&#x60; with &#x60;retry_after&#x60; and nothing is changed.  **Cost:** 1–2 calendar calls + 1 to read back (Vrbo&#39;s calendar quota, the one price pushes use) on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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

    # Update a Vrbo room
    # Change a room's name, description, bathroom type, beds or room amenities. Vrbo cannot change the type of a room: delete it and add one. `beds` replaces the room's beds.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param room_id [String] The room&#39;s &#x60;spaceId&#x60; from GET …/rooms.
    # @param update_vrbo_listing_room_request [UpdateVrboListingRoomRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingRoom200Response]
    def update_vrbo_listing_room(id, room_id, update_vrbo_listing_room_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_room_with_http_info(id, room_id, update_vrbo_listing_room_request, opts)
      data
    end

    # Update a Vrbo room
    # Change a room&#39;s name, description, bathroom type, beds or room amenities. Vrbo cannot change the type of a room: delete it and add one. &#x60;beds&#x60; replaces the room&#39;s beds.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param room_id [String] The room&#39;s &#x60;spaceId&#x60; from GET …/rooms.
    # @param update_vrbo_listing_room_request [UpdateVrboListingRoomRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingRoom200Response, Integer, Hash)>] UpdateVrboListingRoom200Response data, response status code and response headers
    def update_vrbo_listing_room_with_http_info(id, room_id, update_vrbo_listing_room_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_room ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_room"
      end
      # verify the required parameter 'room_id' is set
      if @api_client.config.client_side_validation && room_id.nil?
        fail ArgumentError, "Missing the required parameter 'room_id' when calling VRBOApi.update_vrbo_listing_room"
      end
      # verify the required parameter 'update_vrbo_listing_room_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_room_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_room_request' when calling VRBOApi.update_vrbo_listing_room"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/rooms'.sub('{id}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'roomId'] = room_id
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_room_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingRoom200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_room",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_room\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo safety disclosures
    # Set safety values field by field, as PUT …/amenities does for these two groups: `{\"groups\": {\"homeSafety\": {\"values\": {\"smockDetector\": \"yes\", \"firstAidKit\": true}}}}` (Vrbo's own field ids, as the read lists them). Field ids are in the read.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_safety_disclosures_request [UpdateVrboListingSafetyDisclosuresRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [UpdateVrboListingSafetyDisclosures200Response]
    def update_vrbo_listing_safety_disclosures(id, update_vrbo_listing_safety_disclosures_request, opts = {})
      data, _status_code, _headers = update_vrbo_listing_safety_disclosures_with_http_info(id, update_vrbo_listing_safety_disclosures_request, opts)
      data
    end

    # Update the Vrbo safety disclosures
    # Set safety values field by field, as PUT …/amenities does for these two groups: &#x60;{\&quot;groups\&quot;: {\&quot;homeSafety\&quot;: {\&quot;values\&quot;: {\&quot;smockDetector\&quot;: \&quot;yes\&quot;, \&quot;firstAidKit\&quot;: true}}}}&#x60; (Vrbo&#39;s own field ids, as the read lists them). Field ids are in the read.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param id [String] Repull listing id (numeric string) of a listing linked to Vrbo.
    # @param update_vrbo_listing_safety_disclosures_request [UpdateVrboListingSafetyDisclosuresRequest] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :vrbo_listing_number The Vrbo listing number to work on, when the listing is linked to more than one Vrbo unit.
    # @return [Array<(UpdateVrboListingSafetyDisclosures200Response, Integer, Hash)>] UpdateVrboListingSafetyDisclosures200Response data, response status code and response headers
    def update_vrbo_listing_safety_disclosures_with_http_info(id, update_vrbo_listing_safety_disclosures_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.update_vrbo_listing_safety_disclosures ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.update_vrbo_listing_safety_disclosures"
      end
      # verify the required parameter 'update_vrbo_listing_safety_disclosures_request' is set
      if @api_client.config.client_side_validation && update_vrbo_listing_safety_disclosures_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_vrbo_listing_safety_disclosures_request' when calling VRBOApi.update_vrbo_listing_safety_disclosures"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}/safety-disclosures'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_vrbo_listing_safety_disclosures_request)

      # return_type
      return_type = opts[:debug_return_type] || 'UpdateVrboListingSafetyDisclosures200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.update_vrbo_listing_safety_disclosures",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#update_vrbo_listing_safety_disclosures\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update the Vrbo host story
    # Change the host story of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. Any of `aboutYou`, `whyThisProperty`, `uniqueBenefits`.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the host story of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. Any of &#x60;aboutYou&#x60;, &#x60;whyThisProperty&#x60;, &#x60;uniqueBenefits&#x60;.  **Cost:** 1 call + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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
    # Change the taxes of the listing's existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as `null` means \"none\" (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with `422 invalid_params` when sent empty or `null`, rather than answering OK while Vrbo keeps the old value. `tax`, `stayTax` or `partnerTaxSettings`, in Vrbo's shape (see the read's `raw`).  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is `422 vrbo_rejected` with Vrbo's own message, the refused fields in `errors` and what Vrbo has now in `data`. A malformed body is `422 invalid_params` naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers `403 vrbo_messaging_access`. Returns `403 listing_inactive` when the listing is inactive.
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
    # Change the taxes of the listing&#39;s existing Vrbo listing. **Partial:** send only the fields to change; a field you leave out is never changed on Vrbo, and a field sent as &#x60;null&#x60; means \&quot;none\&quot; (where the field can be cleared). Fields Vrbo can change but never empty once set are refused with &#x60;422 invalid_params&#x60; when sent empty or &#x60;null&#x60;, rather than answering OK while Vrbo keeps the old value. &#x60;tax&#x60;, &#x60;stayTax&#x60; or &#x60;partnerTaxSettings&#x60;, in Vrbo&#39;s shape (see the read&#39;s &#x60;raw&#x60;).  **Cost:** 2 calls + 1 to read back on Vrbo, spaced ~3 s apart per account. The answer comes once Vrbo has saved and the section has been read back.  **When Vrbo refuses** a value the answer is &#x60;422 vrbo_rejected&#x60; with Vrbo&#39;s own message, the refused fields in &#x60;errors&#x60; and what Vrbo has now in &#x60;data&#x60;. A malformed body is &#x60;422 invalid_params&#x60; naming the field, and nothing is sent to Vrbo.  Needs a Vrbo account connected with full access: one connected with messaging access answers &#x60;403 vrbo_messaging_access&#x60;. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
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

    # Act on the Vrbo listing
    # Airbnb's listing actions, on Vrbo:  - `push` / `publish` — push the listing's content onto its Vrbo listing: the same job as `POST /v1/listings/{id}/publish/vrbo` (`202`, poll `GET /v1/listings/{id}/publish/vrbo?jobId=`). Optional `sections` and `vrboListingNumber`. - `unlist` — Vrbo's \"Hide listing\": out of Vrbo search, no new bookings. Read back from Vrbo before answering. - `relist` — Vrbo's \"Reactivate\". - `delete` — deactivate the Repull record (local; the Vrbo listing is not touched — use `unlist` for that).  `unlist` / `relist` act on every Vrbo unit of the listing, or the one named with `vrboListingNumber`. Needs full access. See https://repull.dev/docs/channels/vrbo/listing-content.
    # @param id [String] Repull listing id (numeric string).
    # @param vrbo_listing_action_request [VrboListingActionRequest] 
    # @param [Hash] opts the optional parameters
    # @return [VrboListingAction200Response]
    def vrbo_listing_action(id, vrbo_listing_action_request, opts = {})
      data, _status_code, _headers = vrbo_listing_action_with_http_info(id, vrbo_listing_action_request, opts)
      data
    end

    # Act on the Vrbo listing
    # Airbnb&#39;s listing actions, on Vrbo:  - &#x60;push&#x60; / &#x60;publish&#x60; — push the listing&#39;s content onto its Vrbo listing: the same job as &#x60;POST /v1/listings/{id}/publish/vrbo&#x60; (&#x60;202&#x60;, poll &#x60;GET /v1/listings/{id}/publish/vrbo?jobId&#x3D;&#x60;). Optional &#x60;sections&#x60; and &#x60;vrboListingNumber&#x60;. - &#x60;unlist&#x60; — Vrbo&#39;s \&quot;Hide listing\&quot;: out of Vrbo search, no new bookings. Read back from Vrbo before answering. - &#x60;relist&#x60; — Vrbo&#39;s \&quot;Reactivate\&quot;. - &#x60;delete&#x60; — deactivate the Repull record (local; the Vrbo listing is not touched — use &#x60;unlist&#x60; for that).  &#x60;unlist&#x60; / &#x60;relist&#x60; act on every Vrbo unit of the listing, or the one named with &#x60;vrboListingNumber&#x60;. Needs full access. See https://repull.dev/docs/channels/vrbo/listing-content.
    # @param id [String] Repull listing id (numeric string).
    # @param vrbo_listing_action_request [VrboListingActionRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(VrboListingAction200Response, Integer, Hash)>] VrboListingAction200Response data, response status code and response headers
    def vrbo_listing_action_with_http_info(id, vrbo_listing_action_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.vrbo_listing_action ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling VRBOApi.vrbo_listing_action"
      end
      # verify the required parameter 'vrbo_listing_action_request' is set
      if @api_client.config.client_side_validation && vrbo_listing_action_request.nil?
        fail ArgumentError, "Missing the required parameter 'vrbo_listing_action_request' when calling VRBOApi.vrbo_listing_action"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/listings/{id}'.sub('{id}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(vrbo_listing_action_request)

      # return_type
      return_type = opts[:debug_return_type] || 'VrboListingAction200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.vrbo_listing_action",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#vrbo_listing_action\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Accept, decline, cancel, charge or refund a Vrbo reservation
    # Act on a Vrbo booking by its confirmation code — the counterpart of `POST /v1/channels/airbnb/reservations/{code}`, plus Vrbo's extra charge and refund. **Write-side**: Vrbo's own host-app actions, as the account that owns the booking.  - `accept` — accept a pending booking request. Optional `message` to the guest (≤ 250 characters). - `decline` — decline a pending booking request. `reason` is one of Vrbo's decline reasons (`?options=decline`); `block_dates: true` also blocks the dates (default: they stay open). - `cancel` — cancel a booking as the host. `reason`: `property-sold-or-ownership-change`, `conflict-with-house-rules`, `dates-booked-on-another-platform`, `extenuating-circumstance` or `payment-not-received` (Vrbo's list, read live: `?options=cancel`); `message` to the guest, 25–250 characters; `refund_level` (default `FULL`). **Host cancellations carry Vrbo penalties** — the listing hidden for 7 days and a fee from your payout, unless the cancellation was unavoidable. - `charge` — request an extra payment from the guest: `fee_type` (Vrbo's list, e.g. `PARKING`, `HOT_TUB`, `DEPARTURE_LATE`), `amount` (1–10,000, the booking's currency), `message` (≤ 50 characters) and `due_date`. - `refund` — refund the guest part of what they paid: `reason`, `amount`, `message`. Vrbo offers it once the guest has paid.  **`preview: true`** (cancel, charge, refund) returns Vrbo's own dry run — for a cancel, the terms and penalties (`penalties.cancellationFee`, `penalties.listingHidden`, `refundToGuest`); for a charge, the guest's total with taxes — and changes nothing. Without it, the dry run runs first and the action after, once: a lost answer is `502 vrbo_unconfirmed` (read the booking before retrying), never a second cancel.  Changing dates, times, guests or price is `POST /v1/channels/vrbo/alterations`. The body is validated before anything reaches Vrbo; unknown fields are refused by name. Returns `403 listing_inactive` when the listing is inactive.
    # @param code [String] The Vrbo confirmation code (&#x60;HA-…&#x60;), as in &#x60;GET /v1/channels/vrbo/reservations&#x60;.
    # @param vrbo_reservation_action_request [VrboReservationActionRequest] 
    # @param [Hash] opts the optional parameters
    # @return [VrboReservationAction200Response]
    def vrbo_reservation_action(code, vrbo_reservation_action_request, opts = {})
      data, _status_code, _headers = vrbo_reservation_action_with_http_info(code, vrbo_reservation_action_request, opts)
      data
    end

    # Accept, decline, cancel, charge or refund a Vrbo reservation
    # Act on a Vrbo booking by its confirmation code — the counterpart of &#x60;POST /v1/channels/airbnb/reservations/{code}&#x60;, plus Vrbo&#39;s extra charge and refund. **Write-side**: Vrbo&#39;s own host-app actions, as the account that owns the booking.  - &#x60;accept&#x60; — accept a pending booking request. Optional &#x60;message&#x60; to the guest (≤ 250 characters). - &#x60;decline&#x60; — decline a pending booking request. &#x60;reason&#x60; is one of Vrbo&#39;s decline reasons (&#x60;?options&#x3D;decline&#x60;); &#x60;block_dates: true&#x60; also blocks the dates (default: they stay open). - &#x60;cancel&#x60; — cancel a booking as the host. &#x60;reason&#x60;: &#x60;property-sold-or-ownership-change&#x60;, &#x60;conflict-with-house-rules&#x60;, &#x60;dates-booked-on-another-platform&#x60;, &#x60;extenuating-circumstance&#x60; or &#x60;payment-not-received&#x60; (Vrbo&#39;s list, read live: &#x60;?options&#x3D;cancel&#x60;); &#x60;message&#x60; to the guest, 25–250 characters; &#x60;refund_level&#x60; (default &#x60;FULL&#x60;). **Host cancellations carry Vrbo penalties** — the listing hidden for 7 days and a fee from your payout, unless the cancellation was unavoidable. - &#x60;charge&#x60; — request an extra payment from the guest: &#x60;fee_type&#x60; (Vrbo&#39;s list, e.g. &#x60;PARKING&#x60;, &#x60;HOT_TUB&#x60;, &#x60;DEPARTURE_LATE&#x60;), &#x60;amount&#x60; (1–10,000, the booking&#39;s currency), &#x60;message&#x60; (≤ 50 characters) and &#x60;due_date&#x60;. - &#x60;refund&#x60; — refund the guest part of what they paid: &#x60;reason&#x60;, &#x60;amount&#x60;, &#x60;message&#x60;. Vrbo offers it once the guest has paid.  **&#x60;preview: true&#x60;** (cancel, charge, refund) returns Vrbo&#39;s own dry run — for a cancel, the terms and penalties (&#x60;penalties.cancellationFee&#x60;, &#x60;penalties.listingHidden&#x60;, &#x60;refundToGuest&#x60;); for a charge, the guest&#39;s total with taxes — and changes nothing. Without it, the dry run runs first and the action after, once: a lost answer is &#x60;502 vrbo_unconfirmed&#x60; (read the booking before retrying), never a second cancel.  Changing dates, times, guests or price is &#x60;POST /v1/channels/vrbo/alterations&#x60;. The body is validated before anything reaches Vrbo; unknown fields are refused by name. Returns &#x60;403 listing_inactive&#x60; when the listing is inactive.
    # @param code [String] The Vrbo confirmation code (&#x60;HA-…&#x60;), as in &#x60;GET /v1/channels/vrbo/reservations&#x60;.
    # @param vrbo_reservation_action_request [VrboReservationActionRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(VrboReservationAction200Response, Integer, Hash)>] VrboReservationAction200Response data, response status code and response headers
    def vrbo_reservation_action_with_http_info(code, vrbo_reservation_action_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VRBOApi.vrbo_reservation_action ...'
      end
      # verify the required parameter 'code' is set
      if @api_client.config.client_side_validation && code.nil?
        fail ArgumentError, "Missing the required parameter 'code' when calling VRBOApi.vrbo_reservation_action"
      end
      # verify the required parameter 'vrbo_reservation_action_request' is set
      if @api_client.config.client_side_validation && vrbo_reservation_action_request.nil?
        fail ArgumentError, "Missing the required parameter 'vrbo_reservation_action_request' when calling VRBOApi.vrbo_reservation_action"
      end
      # resource path
      local_var_path = '/v1/channels/vrbo/reservations/{code}'.sub('{code}', CGI.escape(code.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(vrbo_reservation_action_request)

      # return_type
      return_type = opts[:debug_return_type] || 'VrboReservationAction200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"VRBOApi.vrbo_reservation_action",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VRBOApi#vrbo_reservation_action\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
