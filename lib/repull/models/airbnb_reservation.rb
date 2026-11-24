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
  # An Airbnb reservation as returned by the channel API. Use `confirmationCode` to address it in Airbnb operations, and `reservationId` to open the same stay on `GET /v1/reservations/{id}`. The fields after `payoutCurrency` are the Airbnb record as stored (Airbnb's raw status, amounts as decimal strings, stay datetimes); they are kept for existing integrations.
  class AirbnbReservation < ApiModelBase
    # This Airbnb record's id in Repull.
    attr_accessor :id

    # Airbnb confirmation code.
    attr_accessor :confirmation_code

    # The same stay on the unified reservations API: `GET /v1/reservations/{id}`. Null only while that record is still being created.
    attr_accessor :reservation_id

    # The Repull listing id (`GET /v1/listings/{id}`).
    attr_accessor :listing_id

    # Airbnb's own listing id — the value `?listing_id=` takes.
    attr_accessor :airbnb_listing_id

    # Which connected Airbnb account this row belongs to — the Airbnb host id, as a string (they exceed 2^53). The same value `?account_id=` accepts and `GET /v1/connect/airbnb` returns as `accounts[].externalAccountId`.
    attr_accessor :account_id

    # Display name of that connected Airbnb account.
    attr_accessor :account_name

    # Normalised status. Airbnb's own value is in `airbnbStatus`.
    attr_accessor :status

    attr_accessor :check_in

    attr_accessor :check_out

    attr_accessor :guest_name

    attr_accessor :guest_count

    # What the guest paid, in `currency`.
    attr_accessor :total_price

    attr_accessor :currency

    # What the host is expected to receive, in `payoutCurrency`.
    attr_accessor :payout

    attr_accessor :payout_currency

    # Internal link id of the Airbnb listing. Use `airbnbListingId` or `listingId` instead.
    attr_accessor :listing_airbnb_id

    # Same as `confirmationCode`.
    attr_accessor :airbnb_reservation_id

    # Same as `accountId`.
    attr_accessor :host_id

    # The guest's Airbnb user id.
    attr_accessor :guest_airbnb_id

    attr_accessor :guest_first_name

    attr_accessor :guest_last_name

    attr_accessor :guest_profile_picture

    # Airbnb's raw status: `accept`, `pending`, `cancelled_by_guest`, `cancelled_by_host`, `cancelled_by_admin`, `deny`, `failed_verification`, `pending_voided`, `checkpoint_voided`, `timeout`, …
    attr_accessor :airbnb_status

    attr_accessor :cancellation_policy

    attr_accessor :cancellation_reason

    # `totalPrice` as a decimal string.
    attr_accessor :total_paid_amount

    attr_accessor :total_paid_currency

    # `payout` as a decimal string.
    attr_accessor :expected_payout_amount

    attr_accessor :expected_payout_currency

    attr_accessor :canceled_at

    attr_accessor :created_at

    attr_accessor :updated_at

    # Check-in date at 00:00 UTC. Prefer `checkIn`.
    attr_accessor :check_in_datetime

    # Check-out date at 00:00 UTC. Prefer `checkOut`.
    attr_accessor :check_out_datetime

    attr_accessor :time_zone

    # Your workspace id.
    attr_accessor :customer_id

    # The guest on `GET /v1/guests/{id}`.
    attr_accessor :guest_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'confirmation_code' => :'confirmationCode',
        :'reservation_id' => :'reservationId',
        :'listing_id' => :'listingId',
        :'airbnb_listing_id' => :'airbnbListingId',
        :'account_id' => :'accountId',
        :'account_name' => :'accountName',
        :'status' => :'status',
        :'check_in' => :'checkIn',
        :'check_out' => :'checkOut',
        :'guest_name' => :'guestName',
        :'guest_count' => :'guestCount',
        :'total_price' => :'totalPrice',
        :'currency' => :'currency',
        :'payout' => :'payout',
        :'payout_currency' => :'payoutCurrency',
        :'listing_airbnb_id' => :'listingAirbnbId',
        :'airbnb_reservation_id' => :'airbnbReservationId',
        :'host_id' => :'hostId',
        :'guest_airbnb_id' => :'guestAirbnbId',
        :'guest_first_name' => :'guestFirstName',
        :'guest_last_name' => :'guestLastName',
        :'guest_profile_picture' => :'guestProfilePicture',
        :'airbnb_status' => :'airbnbStatus',
        :'cancellation_policy' => :'cancellationPolicy',
        :'cancellation_reason' => :'cancellationReason',
        :'total_paid_amount' => :'totalPaidAmount',
        :'total_paid_currency' => :'totalPaidCurrency',
        :'expected_payout_amount' => :'expectedPayoutAmount',
        :'expected_payout_currency' => :'expectedPayoutCurrency',
        :'canceled_at' => :'canceledAt',
        :'created_at' => :'createdAt',
        :'updated_at' => :'updatedAt',
        :'check_in_datetime' => :'checkInDatetime',
        :'check_out_datetime' => :'checkOutDatetime',
        :'time_zone' => :'timeZone',
        :'customer_id' => :'customerId',
        :'guest_id' => :'guestId'
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
        :'id' => :'String',
        :'confirmation_code' => :'String',
        :'reservation_id' => :'String',
        :'listing_id' => :'String',
        :'airbnb_listing_id' => :'String',
        :'account_id' => :'String',
        :'account_name' => :'String',
        :'status' => :'String',
        :'check_in' => :'Date',
        :'check_out' => :'Date',
        :'guest_name' => :'String',
        :'guest_count' => :'Integer',
        :'total_price' => :'Float',
        :'currency' => :'String',
        :'payout' => :'Float',
        :'payout_currency' => :'String',
        :'listing_airbnb_id' => :'String',
        :'airbnb_reservation_id' => :'String',
        :'host_id' => :'String',
        :'guest_airbnb_id' => :'String',
        :'guest_first_name' => :'String',
        :'guest_last_name' => :'String',
        :'guest_profile_picture' => :'String',
        :'airbnb_status' => :'String',
        :'cancellation_policy' => :'String',
        :'cancellation_reason' => :'String',
        :'total_paid_amount' => :'String',
        :'total_paid_currency' => :'String',
        :'expected_payout_amount' => :'String',
        :'expected_payout_currency' => :'String',
        :'canceled_at' => :'Time',
        :'created_at' => :'Time',
        :'updated_at' => :'Time',
        :'check_in_datetime' => :'Time',
        :'check_out_datetime' => :'Time',
        :'time_zone' => :'String',
        :'customer_id' => :'String',
        :'guest_id' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'confirmation_code',
        :'reservation_id',
        :'listing_id',
        :'airbnb_listing_id',
        :'account_id',
        :'account_name',
        :'status',
        :'check_in',
        :'check_out',
        :'guest_name',
        :'guest_count',
        :'total_price',
        :'currency',
        :'payout',
        :'payout_currency',
        :'listing_airbnb_id',
        :'airbnb_reservation_id',
        :'host_id',
        :'guest_airbnb_id',
        :'guest_first_name',
        :'guest_last_name',
        :'guest_profile_picture',
        :'airbnb_status',
        :'cancellation_policy',
        :'cancellation_reason',
        :'total_paid_amount',
        :'total_paid_currency',
        :'expected_payout_amount',
        :'expected_payout_currency',
        :'canceled_at',
        :'created_at',
        :'updated_at',
        :'check_in_datetime',
        :'check_out_datetime',
        :'time_zone',
        :'customer_id',
        :'guest_id'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::AirbnbReservation` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::AirbnbReservation`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      else
        self.id = nil
      end

      if attributes.key?(:'confirmation_code')
        self.confirmation_code = attributes[:'confirmation_code']
      else
        self.confirmation_code = nil
      end

      if attributes.key?(:'reservation_id')
        self.reservation_id = attributes[:'reservation_id']
      else
        self.reservation_id = nil
      end

      if attributes.key?(:'listing_id')
        self.listing_id = attributes[:'listing_id']
      else
        self.listing_id = nil
      end

      if attributes.key?(:'airbnb_listing_id')
        self.airbnb_listing_id = attributes[:'airbnb_listing_id']
      else
        self.airbnb_listing_id = nil
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      else
        self.account_id = nil
      end

      if attributes.key?(:'account_name')
        self.account_name = attributes[:'account_name']
      else
        self.account_name = nil
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      else
        self.status = nil
      end

      if attributes.key?(:'check_in')
        self.check_in = attributes[:'check_in']
      else
        self.check_in = nil
      end

      if attributes.key?(:'check_out')
        self.check_out = attributes[:'check_out']
      else
        self.check_out = nil
      end

      if attributes.key?(:'guest_name')
        self.guest_name = attributes[:'guest_name']
      else
        self.guest_name = nil
      end

      if attributes.key?(:'guest_count')
        self.guest_count = attributes[:'guest_count']
      else
        self.guest_count = nil
      end

      if attributes.key?(:'total_price')
        self.total_price = attributes[:'total_price']
      else
        self.total_price = nil
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      else
        self.currency = nil
      end

      if attributes.key?(:'payout')
        self.payout = attributes[:'payout']
      else
        self.payout = nil
      end

      if attributes.key?(:'payout_currency')
        self.payout_currency = attributes[:'payout_currency']
      else
        self.payout_currency = nil
      end

      if attributes.key?(:'listing_airbnb_id')
        self.listing_airbnb_id = attributes[:'listing_airbnb_id']
      end

      if attributes.key?(:'airbnb_reservation_id')
        self.airbnb_reservation_id = attributes[:'airbnb_reservation_id']
      end

      if attributes.key?(:'host_id')
        self.host_id = attributes[:'host_id']
      end

      if attributes.key?(:'guest_airbnb_id')
        self.guest_airbnb_id = attributes[:'guest_airbnb_id']
      end

      if attributes.key?(:'guest_first_name')
        self.guest_first_name = attributes[:'guest_first_name']
      end

      if attributes.key?(:'guest_last_name')
        self.guest_last_name = attributes[:'guest_last_name']
      end

      if attributes.key?(:'guest_profile_picture')
        self.guest_profile_picture = attributes[:'guest_profile_picture']
      end

      if attributes.key?(:'airbnb_status')
        self.airbnb_status = attributes[:'airbnb_status']
      end

      if attributes.key?(:'cancellation_policy')
        self.cancellation_policy = attributes[:'cancellation_policy']
      end

      if attributes.key?(:'cancellation_reason')
        self.cancellation_reason = attributes[:'cancellation_reason']
      end

      if attributes.key?(:'total_paid_amount')
        self.total_paid_amount = attributes[:'total_paid_amount']
      end

      if attributes.key?(:'total_paid_currency')
        self.total_paid_currency = attributes[:'total_paid_currency']
      end

      if attributes.key?(:'expected_payout_amount')
        self.expected_payout_amount = attributes[:'expected_payout_amount']
      end

      if attributes.key?(:'expected_payout_currency')
        self.expected_payout_currency = attributes[:'expected_payout_currency']
      end

      if attributes.key?(:'canceled_at')
        self.canceled_at = attributes[:'canceled_at']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'updated_at')
        self.updated_at = attributes[:'updated_at']
      end

      if attributes.key?(:'check_in_datetime')
        self.check_in_datetime = attributes[:'check_in_datetime']
      end

      if attributes.key?(:'check_out_datetime')
        self.check_out_datetime = attributes[:'check_out_datetime']
      end

      if attributes.key?(:'time_zone')
        self.time_zone = attributes[:'time_zone']
      end

      if attributes.key?(:'customer_id')
        self.customer_id = attributes[:'customer_id']
      end

      if attributes.key?(:'guest_id')
        self.guest_id = attributes[:'guest_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @id.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] id Value to be assigned
    def id=(id)
      if id.nil?
        fail ArgumentError, 'id cannot be nil'
      end

      @id = id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          confirmation_code == o.confirmation_code &&
          reservation_id == o.reservation_id &&
          listing_id == o.listing_id &&
          airbnb_listing_id == o.airbnb_listing_id &&
          account_id == o.account_id &&
          account_name == o.account_name &&
          status == o.status &&
          check_in == o.check_in &&
          check_out == o.check_out &&
          guest_name == o.guest_name &&
          guest_count == o.guest_count &&
          total_price == o.total_price &&
          currency == o.currency &&
          payout == o.payout &&
          payout_currency == o.payout_currency &&
          listing_airbnb_id == o.listing_airbnb_id &&
          airbnb_reservation_id == o.airbnb_reservation_id &&
          host_id == o.host_id &&
          guest_airbnb_id == o.guest_airbnb_id &&
          guest_first_name == o.guest_first_name &&
          guest_last_name == o.guest_last_name &&
          guest_profile_picture == o.guest_profile_picture &&
          airbnb_status == o.airbnb_status &&
          cancellation_policy == o.cancellation_policy &&
          cancellation_reason == o.cancellation_reason &&
          total_paid_amount == o.total_paid_amount &&
          total_paid_currency == o.total_paid_currency &&
          expected_payout_amount == o.expected_payout_amount &&
          expected_payout_currency == o.expected_payout_currency &&
          canceled_at == o.canceled_at &&
          created_at == o.created_at &&
          updated_at == o.updated_at &&
          check_in_datetime == o.check_in_datetime &&
          check_out_datetime == o.check_out_datetime &&
          time_zone == o.time_zone &&
          customer_id == o.customer_id &&
          guest_id == o.guest_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, confirmation_code, reservation_id, listing_id, airbnb_listing_id, account_id, account_name, status, check_in, check_out, guest_name, guest_count, total_price, currency, payout, payout_currency, listing_airbnb_id, airbnb_reservation_id, host_id, guest_airbnb_id, guest_first_name, guest_last_name, guest_profile_picture, airbnb_status, cancellation_policy, cancellation_reason, total_paid_amount, total_paid_currency, expected_payout_amount, expected_payout_currency, canceled_at, created_at, updated_at, check_in_datetime, check_out_datetime, time_zone, customer_id, guest_id].hash
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
