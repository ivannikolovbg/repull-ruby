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
  # Priced by `totalPrice` (Airbnb) OR by its parts — `rentalAmount`, `fees`, `damageDeposit` (VRBO) — never both. With `totalPrice`, `checkIn`, `checkOut` and `guests` are required.
  class CreateConversationSpecialOfferRequest < ApiModelBase
    # Repull listing id to offer. Defaults to the listing the conversation is about.
    attr_accessor :listing_id

    attr_accessor :check_in

    # Must be after `checkIn`.
    attr_accessor :check_out

    attr_accessor :guests

    # Airbnb: the total the guest pays for the whole stay, in the listing’s Airbnb currency.
    attr_accessor :total_price

    # VRBO: rent for the whole stay, excluding fees and taxes.
    attr_accessor :rental_amount

    # VRBO: the offer’s fees — replaces its fee list. `type` is VRBO’s fee type (`CLEANING`, `PET`, …).
    attr_accessor :fees

    # VRBO: refundable damage deposit; `null` for none.
    attr_accessor :damage_deposit

    # VRBO: the message sent to the guest with the offer (a friendly default otherwise).
    attr_accessor :message

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'listing_id' => :'listingId',
        :'check_in' => :'checkIn',
        :'check_out' => :'checkOut',
        :'guests' => :'guests',
        :'total_price' => :'totalPrice',
        :'rental_amount' => :'rentalAmount',
        :'fees' => :'fees',
        :'damage_deposit' => :'damageDeposit',
        :'message' => :'message'
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
        :'listing_id' => :'Integer',
        :'check_in' => :'Date',
        :'check_out' => :'Date',
        :'guests' => :'CreateConversationSpecialOfferRequestGuests',
        :'total_price' => :'Float',
        :'rental_amount' => :'Float',
        :'fees' => :'Array<CreateConversationSpecialOfferRequestFeesInner>',
        :'damage_deposit' => :'Float',
        :'message' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'damage_deposit',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::CreateConversationSpecialOfferRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::CreateConversationSpecialOfferRequest`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'listing_id')
        self.listing_id = attributes[:'listing_id']
      end

      if attributes.key?(:'check_in')
        self.check_in = attributes[:'check_in']
      end

      if attributes.key?(:'check_out')
        self.check_out = attributes[:'check_out']
      end

      if attributes.key?(:'guests')
        self.guests = attributes[:'guests']
      end

      if attributes.key?(:'total_price')
        self.total_price = attributes[:'total_price']
      end

      if attributes.key?(:'rental_amount')
        self.rental_amount = attributes[:'rental_amount']
      end

      if attributes.key?(:'fees')
        if (value = attributes[:'fees']).is_a?(Array)
          self.fees = value
        end
      end

      if attributes.key?(:'damage_deposit')
        self.damage_deposit = attributes[:'damage_deposit']
      end

      if attributes.key?(:'message')
        self.message = attributes[:'message']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@total_price.nil? && @total_price <= 0
        invalid_properties.push('invalid value for "total_price", must be greater than 0.')
      end

      if !@rental_amount.nil? && @rental_amount <= 0
        invalid_properties.push('invalid value for "rental_amount", must be greater than 0.')
      end

      if !@damage_deposit.nil? && @damage_deposit < 0
        invalid_properties.push('invalid value for "damage_deposit", must be greater than or equal to 0.')
      end

      if !@message.nil? && @message.to_s.length > 2000
        invalid_properties.push('invalid value for "message", the character length must be smaller than or equal to 2000.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if !@total_price.nil? && @total_price <= 0
      return false if !@rental_amount.nil? && @rental_amount <= 0
      return false if !@damage_deposit.nil? && @damage_deposit < 0
      return false if !@message.nil? && @message.to_s.length > 2000
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] total_price Value to be assigned
    def total_price=(total_price)
      if total_price.nil?
        fail ArgumentError, 'total_price cannot be nil'
      end

      if total_price <= 0
        fail ArgumentError, 'invalid value for "total_price", must be greater than 0.'
      end

      @total_price = total_price
    end

    # Custom attribute writer method with validation
    # @param [Object] rental_amount Value to be assigned
    def rental_amount=(rental_amount)
      if rental_amount.nil?
        fail ArgumentError, 'rental_amount cannot be nil'
      end

      if rental_amount <= 0
        fail ArgumentError, 'invalid value for "rental_amount", must be greater than 0.'
      end

      @rental_amount = rental_amount
    end

    # Custom attribute writer method with validation
    # @param [Object] damage_deposit Value to be assigned
    def damage_deposit=(damage_deposit)
      if !damage_deposit.nil? && damage_deposit < 0
        fail ArgumentError, 'invalid value for "damage_deposit", must be greater than or equal to 0.'
      end

      @damage_deposit = damage_deposit
    end

    # Custom attribute writer method with validation
    # @param [Object] message Value to be assigned
    def message=(message)
      if message.nil?
        fail ArgumentError, 'message cannot be nil'
      end

      if message.to_s.length > 2000
        fail ArgumentError, 'invalid value for "message", the character length must be smaller than or equal to 2000.'
      end

      @message = message
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          listing_id == o.listing_id &&
          check_in == o.check_in &&
          check_out == o.check_out &&
          guests == o.guests &&
          total_price == o.total_price &&
          rental_amount == o.rental_amount &&
          fees == o.fees &&
          damage_deposit == o.damage_deposit &&
          message == o.message
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [listing_id, check_in, check_out, guests, total_price, rental_amount, fees, damage_deposit, message].hash
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
