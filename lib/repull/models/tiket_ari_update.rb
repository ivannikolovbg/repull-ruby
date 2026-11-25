=begin
#Repull API

#The unified API for vacation rental tech. Connect Airbnb, Booking.com, Vrbo and more channels, plus 14 PMS platforms, through one REST API.  ## Designed for AI agents Every error response on this API includes machine-parseable fields so an LLM (Claude in MCP, Cursor, Cline, GPT, etc.) can self-recover without escalating to a human: - `error.code` — stable string identifier (e.g. `invalid_params`, `rate_limit_exceeded`) - `error.message` — human-readable cause - `error.fix` — exact recovery steps (e.g. \"Pass `check_in_after` as ISO 8601: `?check_in_after=2026-01-15`\") - `error.docs_url` — link to the canonical write-up at `https://repull.dev/docs/errors/{code}` - `error.request_id` — id to correlate with server-side logs - `error.field` / `error.value_received` / `error.valid_values` / `error.did_you_mean` — when the error is parameter-specific - `error.retry_after` — seconds to wait before retrying (rate-limit + transient upstream)  `Access-Control-Expose-Headers` lists `x-request-id` and the `X-RateLimit-*` family so browsers can read them on cross-origin responses.  ## Quick Start 1. Get an API key at https://repull.dev/dashboard 2. Connect a PMS: `POST /v1/connect/{provider}` 3. List properties: `GET /v1/properties` 4. Get reservations: `GET /v1/reservations`  ## Authentication All requests require a Bearer token: ``` Authorization: Bearer sk_live_YOUR_API_KEY ```  ## Request Correlation (X-Request-ID) Every response carries an `X-Request-ID` header, e.g. `X-Request-ID: req_01HXY...`. Include this id in support tickets and bug reports — we can trace the full request lifecycle (auth, rate limit, handler, downstream calls, log row) from a single id.  You may set the header on the inbound request to forward your own trace id; we will echo it back instead of generating a new one. Accepted format: `^[\\\\w.-]{1,128}$`.  The id is also embedded in error envelopes as `request_id` so server-side log diffs work even when the response headers are stripped by an intermediate proxy.  ## Rate Limits The public API enforces a per-API-key sliding-window rate limit on top of the per-tier monthly + daily-AI quotas.  **Default policy:** 600 requests per 60 seconds, per API key. Sliding window — there is no fixed-minute boundary you can burst across.  Every response includes:  | Header | Meaning | |---|---| | `X-RateLimit-Limit` | Requests permitted in the current window. | | `X-RateLimit-Remaining` | Requests left in the current window after this call. | | `X-RateLimit-Reset` | Unix epoch (seconds) when the next slot opens. | | `X-RateLimit-Policy` | Machine-readable policy descriptor, e.g. `600;w=60`. | | `Retry-After` | Seconds to wait before retrying. **Only present on 429 responses.** |  **On 429 (rate_limit_exceeded):** the response body matches the standard error envelope with `code: \"rate_limit_exceeded\"`, plus `limit`, `window_seconds`, `retry_after`, and `request_id` fields. SDKs MUST honor `Retry-After` and use exponential backoff with jitter on subsequent retries — never a tight loop.  Recommended backoff: ``` sleep_ms = (Retry-After * 1000) + random(0..250) ```  Monthly + daily-AI tier quotas (`free`, `starter`, `custom`) are enforced separately and also surface as 429s; they include `tier`, `scope`, `limit`, `used` and `resets_at` fields.  **The way past a request quota.** The monthly quota refusal (`429 rate_limit_exceeded` with `scope: \"monthly\"`), `402 credits_exhausted` and `429 daily_limit_exceeded` also carry `upgrade` (the cheapest plan that covers your usage: its exact monthly price for your listings, its request quotas and a `checkout_url` that opens checkout for that price; `plan: \"custom\"` with a `contact_email` when no self-serve plan covers it), `credits` (pay-as-you-go: `usd_per_1000_requests`, `top_up_url`, your `balance_usd`), `resets_at` and `projected_monthly_requests`. The per-minute 429 (`scope: \"per_api_key\"`) carries none of these: wait `Retry-After`.  ## Plan listing limits Each plan includes a number of **active listings**:  | Tier | Active listings | |---|---| | `free` | 3 | | `starter` | no cap: 10 included, then billed per listing | | `custom` | no cap |  Going over the plan never blocks your API calls. Listings beyond the plan are **held back**: they stay connected and keep syncing, but they are not served. A held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`, and collection routes leave it out. Every JSON response then carries a `planNotice` and the `X-Repull-Listings-Held-Back` header, so you know there is more to see.  Choose which listings are active with `POST /v1/listings/status`. Upgrading at `https://repull.dev/dashboard/billing` lifts the cap but does not switch held-back listings on: you choose which to activate afterwards, with the same call or from the dashboard, and each one you switch on is billed from then.  Only a call that would itself take you over the plan is refused, with **`402 listings_limit_exceeded`**: activating listings (`PATCH /v1/listings/{id}` with `{ \"active\": true }`, `POST /v1/listings/status`) or creating one (`POST /v1/listings`). Nothing else changes. The envelope carries the tier, the limit, the active count and an upgrade link next to the standard `code` / `message` / `fix` / `docs_url` / `request_id`.  If an account has more active listings than its plan (for example after a downgrade), calls are still served and `planNotice` says so (code \"listings_over_plan\").  ## Failed payments If your plan's renewal payment fails, nothing is blocked: your API calls keep working while Stripe retries the card. Every successful JSON response then carries a `billingNotice` (code `payment_failed`) with the amount, when it failed, the next automatic retry (`nextRetryAt`) and `payUrl`, the invoice to pay. It disappears once the invoice is paid.

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.22.0

=end

require 'date'
require 'time'

module Repull
  # One date range for one room type (and, for `rates` and `restrictions`, one rate plan). Which fields apply depends on the request's `type`.
  class TiketAriUpdate < ApiModelBase
    # tiket.com room type id. Required on `PUT /v1/channels/tiket/availability`; on the listing route it is always the listing's room.
    attr_accessor :room_type_code

    # tiket.com rate plan id. Required for `rates` and `restrictions` on `PUT /v1/channels/tiket/availability`; on the listing route it defaults to every rate plan of the room selected for pushes.
    attr_accessor :rate_plan_code

    # First night. tiket.com accepts today up to 500 days ahead.
    attr_accessor :start

    # Last night, inclusive.
    attr_accessor :_end

    # `availability`: rooms to sell.
    attr_accessor :available_rooms

    # `rates` on a Room Based property: price per night, tax included. Greater than 0.
    attr_accessor :price

    # `rates` on an Occupancy Based property. Send `price` or `occupancyPrices`, not both.
    attr_accessor :occupancy_prices

    # Children prices. **Children rates are paused.** tiket.com has asked every channel manager not to send children rates until it fixes an issue on its side, so a write that includes `childPrices` is refused with `422 invalid_params` and nothing is sent. Children rates set in the tiket.com extranet still apply. Send `price` or `occupancyPrices` without `childPrices`.
    attr_accessor :child_prices

    # ISO 4217. Defaults to the property currency.
    attr_accessor :currency

    # `restrictions`: minimum nights.
    attr_accessor :min_stay

    # `restrictions`: maximum nights.
    attr_accessor :max_stay

    # `restrictions`: close (`true`) or open (`false`) the rate plan. With `availability` and a `ratePlanCode`, also closes that rate plan.
    attr_accessor :stop_sell

    # `restrictions`.
    attr_accessor :closed_to_arrival

    # `restrictions`.
    attr_accessor :closed_to_departure

    # `restrictions`: minimum days between booking and arrival.
    attr_accessor :min_advance_days

    # `restrictions`: maximum days between booking and arrival.
    attr_accessor :max_advance_days

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'room_type_code' => :'roomTypeCode',
        :'rate_plan_code' => :'ratePlanCode',
        :'start' => :'start',
        :'_end' => :'end',
        :'available_rooms' => :'availableRooms',
        :'price' => :'price',
        :'occupancy_prices' => :'occupancyPrices',
        :'child_prices' => :'childPrices',
        :'currency' => :'currency',
        :'min_stay' => :'minStay',
        :'max_stay' => :'maxStay',
        :'stop_sell' => :'stopSell',
        :'closed_to_arrival' => :'closedToArrival',
        :'closed_to_departure' => :'closedToDeparture',
        :'min_advance_days' => :'minAdvanceDays',
        :'max_advance_days' => :'maxAdvanceDays'
      }
    end

    # Returns attribute mapping this model knows about
    def self.acceptable_attribute_map
      attribute_map
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      acceptable_attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'room_type_code' => :'String',
        :'rate_plan_code' => :'String',
        :'start' => :'Date',
        :'_end' => :'Date',
        :'available_rooms' => :'Integer',
        :'price' => :'Float',
        :'occupancy_prices' => :'Array<TiketOccupancyPrice>',
        :'child_prices' => :'Array<TiketChildPrice>',
        :'currency' => :'String',
        :'min_stay' => :'Integer',
        :'max_stay' => :'Integer',
        :'stop_sell' => :'Boolean',
        :'closed_to_arrival' => :'Boolean',
        :'closed_to_departure' => :'Boolean',
        :'min_advance_days' => :'Integer',
        :'max_advance_days' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::TiketAriUpdate` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::TiketAriUpdate`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'room_type_code')
        self.room_type_code = attributes[:'room_type_code']
      end

      if attributes.key?(:'rate_plan_code')
        self.rate_plan_code = attributes[:'rate_plan_code']
      end

      if attributes.key?(:'start')
        self.start = attributes[:'start']
      else
        self.start = nil
      end

      if attributes.key?(:'_end')
        self._end = attributes[:'_end']
      else
        self._end = nil
      end

      if attributes.key?(:'available_rooms')
        self.available_rooms = attributes[:'available_rooms']
      end

      if attributes.key?(:'price')
        self.price = attributes[:'price']
      end

      if attributes.key?(:'occupancy_prices')
        if (value = attributes[:'occupancy_prices']).is_a?(Array)
          self.occupancy_prices = value
        end
      end

      if attributes.key?(:'child_prices')
        if (value = attributes[:'child_prices']).is_a?(Array)
          self.child_prices = value
        end
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'min_stay')
        self.min_stay = attributes[:'min_stay']
      end

      if attributes.key?(:'max_stay')
        self.max_stay = attributes[:'max_stay']
      end

      if attributes.key?(:'stop_sell')
        self.stop_sell = attributes[:'stop_sell']
      end

      if attributes.key?(:'closed_to_arrival')
        self.closed_to_arrival = attributes[:'closed_to_arrival']
      end

      if attributes.key?(:'closed_to_departure')
        self.closed_to_departure = attributes[:'closed_to_departure']
      end

      if attributes.key?(:'min_advance_days')
        self.min_advance_days = attributes[:'min_advance_days']
      end

      if attributes.key?(:'max_advance_days')
        self.max_advance_days = attributes[:'max_advance_days']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @start.nil?
        invalid_properties.push('invalid value for "start", start cannot be nil.')
      end

      if @_end.nil?
        invalid_properties.push('invalid value for "_end", _end cannot be nil.')
      end

      if !@available_rooms.nil? && @available_rooms < 0
        invalid_properties.push('invalid value for "available_rooms", must be greater than or equal to 0.')
      end

      if !@min_stay.nil? && @min_stay > 365
        invalid_properties.push('invalid value for "min_stay", must be smaller than or equal to 365.')
      end

      if !@min_stay.nil? && @min_stay < 0
        invalid_properties.push('invalid value for "min_stay", must be greater than or equal to 0.')
      end

      if !@max_stay.nil? && @max_stay > 365
        invalid_properties.push('invalid value for "max_stay", must be smaller than or equal to 365.')
      end

      if !@max_stay.nil? && @max_stay < 0
        invalid_properties.push('invalid value for "max_stay", must be greater than or equal to 0.')
      end

      if !@min_advance_days.nil? && @min_advance_days > 500
        invalid_properties.push('invalid value for "min_advance_days", must be smaller than or equal to 500.')
      end

      if !@min_advance_days.nil? && @min_advance_days < 0
        invalid_properties.push('invalid value for "min_advance_days", must be greater than or equal to 0.')
      end

      if !@max_advance_days.nil? && @max_advance_days > 500
        invalid_properties.push('invalid value for "max_advance_days", must be smaller than or equal to 500.')
      end

      if !@max_advance_days.nil? && @max_advance_days < 0
        invalid_properties.push('invalid value for "max_advance_days", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @start.nil?
      return false if @_end.nil?
      return false if !@available_rooms.nil? && @available_rooms < 0
      return false if !@min_stay.nil? && @min_stay > 365
      return false if !@min_stay.nil? && @min_stay < 0
      return false if !@max_stay.nil? && @max_stay > 365
      return false if !@max_stay.nil? && @max_stay < 0
      return false if !@min_advance_days.nil? && @min_advance_days > 500
      return false if !@min_advance_days.nil? && @min_advance_days < 0
      return false if !@max_advance_days.nil? && @max_advance_days > 500
      return false if !@max_advance_days.nil? && @max_advance_days < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] start Value to be assigned
    def start=(start)
      if start.nil?
        fail ArgumentError, 'start cannot be nil'
      end

      @start = start
    end

    # Custom attribute writer method with validation
    # @param [Object] _end Value to be assigned
    def _end=(_end)
      if _end.nil?
        fail ArgumentError, '_end cannot be nil'
      end

      @_end = _end
    end

    # Custom attribute writer method with validation
    # @param [Object] available_rooms Value to be assigned
    def available_rooms=(available_rooms)
      if available_rooms.nil?
        fail ArgumentError, 'available_rooms cannot be nil'
      end

      if available_rooms < 0
        fail ArgumentError, 'invalid value for "available_rooms", must be greater than or equal to 0.'
      end

      @available_rooms = available_rooms
    end

    # Custom attribute writer method with validation
    # @param [Object] min_stay Value to be assigned
    def min_stay=(min_stay)
      if min_stay.nil?
        fail ArgumentError, 'min_stay cannot be nil'
      end

      if min_stay > 365
        fail ArgumentError, 'invalid value for "min_stay", must be smaller than or equal to 365.'
      end

      if min_stay < 0
        fail ArgumentError, 'invalid value for "min_stay", must be greater than or equal to 0.'
      end

      @min_stay = min_stay
    end

    # Custom attribute writer method with validation
    # @param [Object] max_stay Value to be assigned
    def max_stay=(max_stay)
      if max_stay.nil?
        fail ArgumentError, 'max_stay cannot be nil'
      end

      if max_stay > 365
        fail ArgumentError, 'invalid value for "max_stay", must be smaller than or equal to 365.'
      end

      if max_stay < 0
        fail ArgumentError, 'invalid value for "max_stay", must be greater than or equal to 0.'
      end

      @max_stay = max_stay
    end

    # Custom attribute writer method with validation
    # @param [Object] min_advance_days Value to be assigned
    def min_advance_days=(min_advance_days)
      if min_advance_days.nil?
        fail ArgumentError, 'min_advance_days cannot be nil'
      end

      if min_advance_days > 500
        fail ArgumentError, 'invalid value for "min_advance_days", must be smaller than or equal to 500.'
      end

      if min_advance_days < 0
        fail ArgumentError, 'invalid value for "min_advance_days", must be greater than or equal to 0.'
      end

      @min_advance_days = min_advance_days
    end

    # Custom attribute writer method with validation
    # @param [Object] max_advance_days Value to be assigned
    def max_advance_days=(max_advance_days)
      if max_advance_days.nil?
        fail ArgumentError, 'max_advance_days cannot be nil'
      end

      if max_advance_days > 500
        fail ArgumentError, 'invalid value for "max_advance_days", must be smaller than or equal to 500.'
      end

      if max_advance_days < 0
        fail ArgumentError, 'invalid value for "max_advance_days", must be greater than or equal to 0.'
      end

      @max_advance_days = max_advance_days
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          room_type_code == o.room_type_code &&
          rate_plan_code == o.rate_plan_code &&
          start == o.start &&
          _end == o._end &&
          available_rooms == o.available_rooms &&
          price == o.price &&
          occupancy_prices == o.occupancy_prices &&
          child_prices == o.child_prices &&
          currency == o.currency &&
          min_stay == o.min_stay &&
          max_stay == o.max_stay &&
          stop_sell == o.stop_sell &&
          closed_to_arrival == o.closed_to_arrival &&
          closed_to_departure == o.closed_to_departure &&
          min_advance_days == o.min_advance_days &&
          max_advance_days == o.max_advance_days
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [room_type_code, rate_plan_code, start, _end, available_rooms, price, occupancy_prices, child_prices, currency, min_stay, max_stay, stop_sell, closed_to_arrival, closed_to_departure, min_advance_days, max_advance_days].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

  end

end
