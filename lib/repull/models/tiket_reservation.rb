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
  # One booked room of a tiket.com reservation, as tiket.com delivered it.
  class TiketReservation < ApiModelBase
    # The Repull reservation this room became (`GET /v1/reservations/{id}`). `null` while the room type is not mapped to a listing; mapping it records the booking.
    attr_accessor :reservation_id

    # `<tiketReservationId>` for the first room, `<tiketReservationId>-2`, `-3`, … for the others.
    attr_accessor :confirmation_code

    # tiket.com's id of the whole booking.
    attr_accessor :tiket_reservation_id

    # Set when this booking replaced an earlier one. tiket.com sends a date change as a cancellation plus a new booking; Repull applies it as a change to the original reservation.
    attr_accessor :previous_tiket_reservation_id

    # 1 for the first room of the booking.
    attr_accessor :room_index

    # tiket.com Hotel ID.
    attr_accessor :property_id

    attr_accessor :room_type_code

    attr_accessor :rate_plan_code

    attr_accessor :rate_plan_name

    attr_accessor :check_in

    attr_accessor :check_out

    attr_accessor :adults

    attr_accessor :children

    attr_accessor :infants

    attr_accessor :guest_name

    attr_accessor :guest_country

    # What the guest paid for this room.
    attr_accessor :total_amount

    # What tiket.com pays the property for this room.
    attr_accessor :net_amount

    attr_accessor :currency

    # Payment type as tiket.com sent it.
    attr_accessor :payment_type

    # How tiket.com pays the property: `Virtual Credit Card` or `Bank Transfer`. Card details are never returned by the API.
    attr_accessor :payment_method

    attr_accessor :meal_plan_code

    attr_accessor :non_refundable

    # Cancellation policy text as tiket.com sent it.
    attr_accessor :cancellation_policy

    attr_accessor :special_requests

    attr_accessor :status

    attr_accessor :created_at

    attr_accessor :updated_at

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'reservation_id' => :'reservationId',
        :'confirmation_code' => :'confirmationCode',
        :'tiket_reservation_id' => :'tiketReservationId',
        :'previous_tiket_reservation_id' => :'previousTiketReservationId',
        :'room_index' => :'roomIndex',
        :'property_id' => :'propertyId',
        :'room_type_code' => :'roomTypeCode',
        :'rate_plan_code' => :'ratePlanCode',
        :'rate_plan_name' => :'ratePlanName',
        :'check_in' => :'checkIn',
        :'check_out' => :'checkOut',
        :'adults' => :'adults',
        :'children' => :'children',
        :'infants' => :'infants',
        :'guest_name' => :'guestName',
        :'guest_country' => :'guestCountry',
        :'total_amount' => :'totalAmount',
        :'net_amount' => :'netAmount',
        :'currency' => :'currency',
        :'payment_type' => :'paymentType',
        :'payment_method' => :'paymentMethod',
        :'meal_plan_code' => :'mealPlanCode',
        :'non_refundable' => :'nonRefundable',
        :'cancellation_policy' => :'cancellationPolicy',
        :'special_requests' => :'specialRequests',
        :'status' => :'status',
        :'created_at' => :'createdAt',
        :'updated_at' => :'updatedAt'
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
        :'reservation_id' => :'String',
        :'confirmation_code' => :'String',
        :'tiket_reservation_id' => :'String',
        :'previous_tiket_reservation_id' => :'String',
        :'room_index' => :'Integer',
        :'property_id' => :'String',
        :'room_type_code' => :'String',
        :'rate_plan_code' => :'String',
        :'rate_plan_name' => :'String',
        :'check_in' => :'Date',
        :'check_out' => :'Date',
        :'adults' => :'Integer',
        :'children' => :'Integer',
        :'infants' => :'Integer',
        :'guest_name' => :'String',
        :'guest_country' => :'String',
        :'total_amount' => :'Float',
        :'net_amount' => :'Float',
        :'currency' => :'String',
        :'payment_type' => :'String',
        :'payment_method' => :'String',
        :'meal_plan_code' => :'String',
        :'non_refundable' => :'Boolean',
        :'cancellation_policy' => :'String',
        :'special_requests' => :'String',
        :'status' => :'String',
        :'created_at' => :'Time',
        :'updated_at' => :'Time'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'reservation_id',
        :'previous_tiket_reservation_id',
        :'property_id',
        :'room_type_code',
        :'rate_plan_code',
        :'rate_plan_name',
        :'check_in',
        :'check_out',
        :'guest_name',
        :'guest_country',
        :'total_amount',
        :'net_amount',
        :'currency',
        :'payment_type',
        :'payment_method',
        :'meal_plan_code',
        :'non_refundable',
        :'cancellation_policy',
        :'special_requests',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::TiketReservation` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::TiketReservation`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'reservation_id')
        self.reservation_id = attributes[:'reservation_id']
      end

      if attributes.key?(:'confirmation_code')
        self.confirmation_code = attributes[:'confirmation_code']
      end

      if attributes.key?(:'tiket_reservation_id')
        self.tiket_reservation_id = attributes[:'tiket_reservation_id']
      end

      if attributes.key?(:'previous_tiket_reservation_id')
        self.previous_tiket_reservation_id = attributes[:'previous_tiket_reservation_id']
      end

      if attributes.key?(:'room_index')
        self.room_index = attributes[:'room_index']
      end

      if attributes.key?(:'property_id')
        self.property_id = attributes[:'property_id']
      end

      if attributes.key?(:'room_type_code')
        self.room_type_code = attributes[:'room_type_code']
      end

      if attributes.key?(:'rate_plan_code')
        self.rate_plan_code = attributes[:'rate_plan_code']
      end

      if attributes.key?(:'rate_plan_name')
        self.rate_plan_name = attributes[:'rate_plan_name']
      end

      if attributes.key?(:'check_in')
        self.check_in = attributes[:'check_in']
      end

      if attributes.key?(:'check_out')
        self.check_out = attributes[:'check_out']
      end

      if attributes.key?(:'adults')
        self.adults = attributes[:'adults']
      end

      if attributes.key?(:'children')
        self.children = attributes[:'children']
      end

      if attributes.key?(:'infants')
        self.infants = attributes[:'infants']
      end

      if attributes.key?(:'guest_name')
        self.guest_name = attributes[:'guest_name']
      end

      if attributes.key?(:'guest_country')
        self.guest_country = attributes[:'guest_country']
      end

      if attributes.key?(:'total_amount')
        self.total_amount = attributes[:'total_amount']
      end

      if attributes.key?(:'net_amount')
        self.net_amount = attributes[:'net_amount']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'payment_type')
        self.payment_type = attributes[:'payment_type']
      end

      if attributes.key?(:'payment_method')
        self.payment_method = attributes[:'payment_method']
      end

      if attributes.key?(:'meal_plan_code')
        self.meal_plan_code = attributes[:'meal_plan_code']
      end

      if attributes.key?(:'non_refundable')
        self.non_refundable = attributes[:'non_refundable']
      end

      if attributes.key?(:'cancellation_policy')
        self.cancellation_policy = attributes[:'cancellation_policy']
      end

      if attributes.key?(:'special_requests')
        self.special_requests = attributes[:'special_requests']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'updated_at')
        self.updated_at = attributes[:'updated_at']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          reservation_id == o.reservation_id &&
          confirmation_code == o.confirmation_code &&
          tiket_reservation_id == o.tiket_reservation_id &&
          previous_tiket_reservation_id == o.previous_tiket_reservation_id &&
          room_index == o.room_index &&
          property_id == o.property_id &&
          room_type_code == o.room_type_code &&
          rate_plan_code == o.rate_plan_code &&
          rate_plan_name == o.rate_plan_name &&
          check_in == o.check_in &&
          check_out == o.check_out &&
          adults == o.adults &&
          children == o.children &&
          infants == o.infants &&
          guest_name == o.guest_name &&
          guest_country == o.guest_country &&
          total_amount == o.total_amount &&
          net_amount == o.net_amount &&
          currency == o.currency &&
          payment_type == o.payment_type &&
          payment_method == o.payment_method &&
          meal_plan_code == o.meal_plan_code &&
          non_refundable == o.non_refundable &&
          cancellation_policy == o.cancellation_policy &&
          special_requests == o.special_requests &&
          status == o.status &&
          created_at == o.created_at &&
          updated_at == o.updated_at
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [reservation_id, confirmation_code, tiket_reservation_id, previous_tiket_reservation_id, room_index, property_id, room_type_code, rate_plan_code, rate_plan_name, check_in, check_out, adults, children, infants, guest_name, guest_country, total_amount, net_amount, currency, payment_type, payment_method, meal_plan_code, non_refundable, cancellation_policy, special_requests, status, created_at, updated_at].hash
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
