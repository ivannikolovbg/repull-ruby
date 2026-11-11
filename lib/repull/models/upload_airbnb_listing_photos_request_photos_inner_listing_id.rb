=begin
#Repull API

#The unified API for vacation rental tech. Connect Airbnb, Booking.com, Vrbo and more channels, plus 14 PMS platforms, through one REST API.  ## Designed for AI agents Every error response on this API includes machine-parseable fields so an LLM (Claude in MCP, Cursor, Cline, GPT, etc.) can self-recover without escalating to a human: - `error.code` — stable string identifier (e.g. `invalid_params`, `rate_limit_exceeded`) - `error.message` — human-readable cause - `error.fix` — exact recovery steps (e.g. \"Pass `check_in_after` as ISO 8601: `?check_in_after=2026-01-15`\") - `error.docs_url` — link to the canonical write-up at `https://repull.dev/docs/errors/{code}` - `error.request_id` — id to correlate with server-side logs - `error.field` / `error.value_received` / `error.valid_values` / `error.did_you_mean` — when the error is parameter-specific - `error.retry_after` — seconds to wait before retrying (rate-limit + transient upstream)  `Access-Control-Expose-Headers` lists `x-request-id` and the `X-RateLimit-*` family so browsers can read them on cross-origin responses.  ## Quick Start 1. Get an API key at https://repull.dev/dashboard 2. Connect a PMS: `POST /v1/connect/{provider}` 3. List properties: `GET /v1/properties` 4. Get reservations: `GET /v1/reservations`  ## Authentication All requests require a Bearer token: ``` Authorization: Bearer sk_live_YOUR_API_KEY ```  ## Request Correlation (X-Request-ID) Every response carries an `X-Request-ID` header, e.g. `X-Request-ID: req_01HXY...`. Include this id in support tickets and bug reports — we can trace the full request lifecycle (auth, rate limit, handler, downstream calls, log row) from a single id.  You may set the header on the inbound request to forward your own trace id; we will echo it back instead of generating a new one. Accepted format: `^[\\\\w.-]{1,128}$`.  The id is also embedded in error envelopes as `request_id` so server-side log diffs work even when the response headers are stripped by an intermediate proxy.  ## Rate Limits The public API enforces a per-API-key sliding-window rate limit on top of the per-tier monthly + daily-AI quotas.  **Default policy:** 600 requests per 60 seconds, per API key. Sliding window — there is no fixed-minute boundary you can burst across.  Every response includes:  | Header | Meaning | |---|---| | `X-RateLimit-Limit` | Requests permitted in the current window. | | `X-RateLimit-Remaining` | Requests left in the current window after this call. | | `X-RateLimit-Reset` | Unix epoch (seconds) when the next slot opens. | | `X-RateLimit-Policy` | Machine-readable policy descriptor, e.g. `600;w=60`. | | `Retry-After` | Seconds to wait before retrying. **Only present on 429 responses.** |  **On 429 (rate_limit_exceeded):** the response body matches the standard error envelope with `code: \"rate_limit_exceeded\"`, plus `limit`, `window_seconds`, `retry_after`, and `request_id` fields. SDKs MUST honor `Retry-After` and use exponential backoff with jitter on subsequent retries — never a tight loop.  Recommended backoff: ``` sleep_ms = (Retry-After * 1000) + random(0..250) ```  Monthly + daily-AI tier quotas (`free`, `starter`, `custom`) are enforced separately and also surface as 429s; they include `tier`, `scope`, `limit`, `used` and `resets_at` fields.  **The way past a request quota.** The monthly quota refusal (`429 rate_limit_exceeded` with `scope: \"monthly\"`), `402 credits_exhausted` and `429 daily_limit_exceeded` also carry `upgrade` (the cheapest plan that covers your usage: its exact monthly price for your listings, its request quotas and a `checkout_url` that opens checkout for that price; `plan: \"custom\"` with a `contact_email` when no self-serve plan covers it), `credits` (pay-as-you-go: `usd_per_1000_requests`, `top_up_url`, your `balance_usd`), `resets_at` and `projected_monthly_requests`. The per-minute 429 (`scope: \"per_api_key\"`) carries none of these: wait `Retry-After`.  ## Plan listing limits Each plan includes a number of **active listings**:  | Tier | Active listings | |---|---| | `free` | 3 | | `starter` | no cap: 10 included, then billed per listing | | `custom` | no cap |  Going over the plan never blocks your API calls. Listings beyond the plan are **held back**: they stay connected and keep syncing, but they are not served. A held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`, and collection routes leave it out. Every JSON response then carries a `planNotice` and the `X-Repull-Listings-Held-Back` header, so you know there is more to see.  Choose which listings are active with `POST /v1/listings/status`, or upgrade at `https://repull.dev/dashboard/billing` to activate them all.  Only a call that would itself take you over the plan is refused, with **`402 listings_limit_exceeded`**: activating listings (`PATCH /v1/listings/{id}` with `{ \"active\": true }`, `POST /v1/listings/status`) or creating one (`POST /v1/listings`). Nothing else changes. The envelope carries the tier, the limit, the active count and an upgrade link next to the standard `code` / `message` / `fix` / `docs_url` / `request_id`.  If an account has more active listings than its plan (for example after a downgrade), calls are still served and `planNotice` says so (code \"listings_over_plan\").

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.22.0

=end

require 'date'
require 'time'

module Repull
  # Accepted and ignored — the listing comes from the path.
  module UploadAirbnbListingPhotosRequestPhotosInnerListingId
    class << self
      # List of class defined in oneOf (OpenAPI v3)
      def openapi_one_of
        [
          :'Integer',
          :'String'
        ]
      end

      # Builds the object
      # @param [Mixed] Data to be matched against the list of oneOf items
      # @return [Object] Returns the model or the data itself
      def build(data)
        # Go through the list of oneOf items and attempt to identify the appropriate one.
        # Note:
        # - We do not attempt to check whether exactly one item matches.
        # - No advanced validation of types in some cases (e.g. "x: { type: string }" will happily match { x: 123 })
        #   due to the way the deserialization is made in the base_object template (it just casts without verifying).
        # - TODO: scalar values are de facto behaving as if they were nullable.
        # - TODO: logging when debugging is set.
        openapi_one_of.each do |klass|
          begin
            next if klass == :AnyType # "nullable: true"
            return find_and_cast_into_type(klass, data)
          rescue # rescue all errors so we keep iterating even if the current item lookup raises
          end
        end

        openapi_one_of.include?(:AnyType) ? data : nil
      end

      private

      SchemaMismatchError = Class.new(StandardError)

      # Note: 'File' is missing here because in the regular case we get the data _after_ a call to JSON.parse.
      def find_and_cast_into_type(klass, data)
        return if data.nil?

        case klass.to_s
        when 'Boolean'
          return data if data.instance_of?(TrueClass) || data.instance_of?(FalseClass)
        when 'Float'
          return data if data.instance_of?(Float)
        when 'Integer'
          return data if data.instance_of?(Integer)
        when 'Time'
          return Time.parse(data)
        when 'Date'
          return Date.iso8601(data)
        when 'String'
          return data if data.instance_of?(String)
        when 'Object' # "type: object"
          return data if data.instance_of?(Hash)
        when /\AArray<(?<sub_type>.+)>\z/ # "type: array"
          if data.instance_of?(Array)
            sub_type = Regexp.last_match[:sub_type]
            return data.map { |item| find_and_cast_into_type(sub_type, item) }
          end
        when /\AHash<String, (?<sub_type>.+)>\z/ # "type: object" with "additionalProperties: { ... }"
          if data.instance_of?(Hash) && data.keys.all? { |k| k.instance_of?(Symbol) || k.instance_of?(String) }
            sub_type = Regexp.last_match[:sub_type]
            return data.each_with_object({}) { |(k, v), hsh| hsh[k] = find_and_cast_into_type(sub_type, v) }
          end
        else # model
          const = Repull.const_get(klass)
          if const
            if const.respond_to?(:openapi_one_of) # nested oneOf model
              model = const.build(data)
              return model if model
            else
              # raise if data contains keys that are not known to the model
              raise if const.respond_to?(:acceptable_attributes) && !(data.keys - const.acceptable_attributes).empty?
              model = const.build_from_hash(data)
              return model if model
            end
          end
        end

        raise # if no match by now, raise
      rescue
        raise SchemaMismatchError, "#{data} doesn't match the #{klass} type"
      end
    end
  end

end
