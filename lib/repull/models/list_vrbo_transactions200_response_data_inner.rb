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
  class ListVrboTransactions200ResponseDataInner < ApiModelBase
    # Stable: the deposit's reference number on a Payout row; `<reference>:<confirmationCode>:<n>` on a line; `upcoming:<confirmationCode>:<n>` on a scheduled payout.
    attr_accessor :transaction_id

    attr_accessor :account_id

    attr_accessor :account_name

    attr_accessor :status

    # `Payout` (the bank deposit), `Reservation` (a booking it paid), `Adjustment` (money taken back from it).
    attr_accessor :type

    attr_accessor :is_payout

    attr_accessor :date

    attr_accessor :currency

    # Signed: what this line adds to its deposit. On a Payout row, the amount deposited.
    attr_accessor :amount

    attr_accessor :payout

    attr_accessor :confirmation_code

    # The Repull reservation, when the booking is in the workspace.
    attr_accessor :reservation_id

    attr_accessor :listing_id

    attr_accessor :vrbo_listing_number

    attr_accessor :on_inactive_listing

    attr_accessor :guest_name

    # On an UPCOMING line: Vrbo's status for the payout (`Scheduled`, `Blocked`, …).
    attr_accessor :upcoming_status

    attr_accessor :unavailable_fields

    attr_accessor :synced_at

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'transaction_id' => :'transactionId',
        :'account_id' => :'accountId',
        :'account_name' => :'accountName',
        :'status' => :'status',
        :'type' => :'type',
        :'is_payout' => :'isPayout',
        :'date' => :'date',
        :'currency' => :'currency',
        :'amount' => :'amount',
        :'payout' => :'payout',
        :'confirmation_code' => :'confirmationCode',
        :'reservation_id' => :'reservationId',
        :'listing_id' => :'listingId',
        :'vrbo_listing_number' => :'vrboListingNumber',
        :'on_inactive_listing' => :'onInactiveListing',
        :'guest_name' => :'guestName',
        :'upcoming_status' => :'upcomingStatus',
        :'unavailable_fields' => :'unavailableFields',
        :'synced_at' => :'syncedAt'
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
        :'transaction_id' => :'String',
        :'account_id' => :'String',
        :'account_name' => :'String',
        :'status' => :'String',
        :'type' => :'String',
        :'is_payout' => :'Boolean',
        :'date' => :'Date',
        :'currency' => :'String',
        :'amount' => :'Float',
        :'payout' => :'ListVrboTransactions200ResponseDataInnerPayout',
        :'confirmation_code' => :'String',
        :'reservation_id' => :'Integer',
        :'listing_id' => :'Integer',
        :'vrbo_listing_number' => :'String',
        :'on_inactive_listing' => :'Boolean',
        :'guest_name' => :'String',
        :'upcoming_status' => :'String',
        :'unavailable_fields' => :'Array<String>',
        :'synced_at' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'account_id',
        :'account_name',
        :'date',
        :'currency',
        :'amount',
        :'confirmation_code',
        :'reservation_id',
        :'listing_id',
        :'vrbo_listing_number',
        :'guest_name',
        :'upcoming_status',
        :'synced_at'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::ListVrboTransactions200ResponseDataInner` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::ListVrboTransactions200ResponseDataInner`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'transaction_id')
        self.transaction_id = attributes[:'transaction_id']
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'account_name')
        self.account_name = attributes[:'account_name']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'is_payout')
        self.is_payout = attributes[:'is_payout']
      end

      if attributes.key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'payout')
        self.payout = attributes[:'payout']
      end

      if attributes.key?(:'confirmation_code')
        self.confirmation_code = attributes[:'confirmation_code']
      end

      if attributes.key?(:'reservation_id')
        self.reservation_id = attributes[:'reservation_id']
      end

      if attributes.key?(:'listing_id')
        self.listing_id = attributes[:'listing_id']
      end

      if attributes.key?(:'vrbo_listing_number')
        self.vrbo_listing_number = attributes[:'vrbo_listing_number']
      end

      if attributes.key?(:'on_inactive_listing')
        self.on_inactive_listing = attributes[:'on_inactive_listing']
      end

      if attributes.key?(:'guest_name')
        self.guest_name = attributes[:'guest_name']
      end

      if attributes.key?(:'upcoming_status')
        self.upcoming_status = attributes[:'upcoming_status']
      end

      if attributes.key?(:'unavailable_fields')
        if (value = attributes[:'unavailable_fields']).is_a?(Array)
          self.unavailable_fields = value
        end
      end

      if attributes.key?(:'synced_at')
        self.synced_at = attributes[:'synced_at']
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
      status_validator = EnumAttributeValidator.new('String', ["COMPLETED", "UPCOMING"])
      return false unless status_validator.valid?(@status)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ["COMPLETED", "UPCOMING"])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          transaction_id == o.transaction_id &&
          account_id == o.account_id &&
          account_name == o.account_name &&
          status == o.status &&
          type == o.type &&
          is_payout == o.is_payout &&
          date == o.date &&
          currency == o.currency &&
          amount == o.amount &&
          payout == o.payout &&
          confirmation_code == o.confirmation_code &&
          reservation_id == o.reservation_id &&
          listing_id == o.listing_id &&
          vrbo_listing_number == o.vrbo_listing_number &&
          on_inactive_listing == o.on_inactive_listing &&
          guest_name == o.guest_name &&
          upcoming_status == o.upcoming_status &&
          unavailable_fields == o.unavailable_fields &&
          synced_at == o.synced_at
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [transaction_id, account_id, account_name, status, type, is_payout, date, currency, amount, payout, confirmation_code, reservation_id, listing_id, vrbo_listing_number, on_inactive_listing, guest_name, upcoming_status, unavailable_fields, synced_at].hash
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
