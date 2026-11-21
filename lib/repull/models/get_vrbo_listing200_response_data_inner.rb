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
  class GetVrboListing200ResponseDataInner < ApiModelBase
    # Repull's id for this link.
    attr_accessor :id

    attr_accessor :listing_id

    # The number in the Vrbo URL (vrbo.com/5506023).
    attr_accessor :vrbo_listing_number

    attr_accessor :unit_id

    # Vrbo's property id.
    attr_accessor :property_id

    attr_accessor :advertiser_id

    attr_accessor :url

    # Vrbo's own status: `LIVE`, `InactiveByOwnerRequest` (hidden), …
    attr_accessor :status

    attr_accessor :live

    # Linked through a connected Vrbo account — the link content, calendar and messages go through.
    attr_accessor :connected

    attr_accessor :active

    attr_accessor :sync_enabled

    # The Vrbo account the unit is on, as `GET /v1/connect/vrbo-login` lists it.
    attr_accessor :account_id

    attr_accessor :account_name

    attr_accessor :access_type

    attr_accessor :account_status

    attr_accessor :headline

    attr_accessor :name

    attr_accessor :thumbnail_url

    attr_accessor :currency

    # The markup Repull adds to this unit's prices.
    attr_accessor :markup_percent

    attr_accessor :booking_policy

    attr_accessor :capacity

    attr_accessor :bedrooms

    attr_accessor :bathrooms

    attr_accessor :beds

    attr_accessor :check_in_time

    attr_accessor :check_out_time

    attr_accessor :min_stay

    attr_accessor :max_stay

    attr_accessor :min_advance_notice_days

    attr_accessor :address

    attr_accessor :rating

    attr_accessor :host_name

    attr_accessor :linked_at

    attr_accessor :disconnected_at

    attr_accessor :details_synced_at

    attr_accessor :content

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
        :'id' => :'id',
        :'listing_id' => :'listingId',
        :'vrbo_listing_number' => :'vrboListingNumber',
        :'unit_id' => :'unitId',
        :'property_id' => :'propertyId',
        :'advertiser_id' => :'advertiserId',
        :'url' => :'url',
        :'status' => :'status',
        :'live' => :'live',
        :'connected' => :'connected',
        :'active' => :'active',
        :'sync_enabled' => :'syncEnabled',
        :'account_id' => :'accountId',
        :'account_name' => :'accountName',
        :'access_type' => :'accessType',
        :'account_status' => :'accountStatus',
        :'headline' => :'headline',
        :'name' => :'name',
        :'thumbnail_url' => :'thumbnailUrl',
        :'currency' => :'currency',
        :'markup_percent' => :'markupPercent',
        :'booking_policy' => :'bookingPolicy',
        :'capacity' => :'capacity',
        :'bedrooms' => :'bedrooms',
        :'bathrooms' => :'bathrooms',
        :'beds' => :'beds',
        :'check_in_time' => :'checkInTime',
        :'check_out_time' => :'checkOutTime',
        :'min_stay' => :'minStay',
        :'max_stay' => :'maxStay',
        :'min_advance_notice_days' => :'minAdvanceNoticeDays',
        :'address' => :'address',
        :'rating' => :'rating',
        :'host_name' => :'hostName',
        :'linked_at' => :'linkedAt',
        :'disconnected_at' => :'disconnectedAt',
        :'details_synced_at' => :'detailsSyncedAt',
        :'content' => :'content'
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
        :'listing_id' => :'String',
        :'vrbo_listing_number' => :'String',
        :'unit_id' => :'String',
        :'property_id' => :'String',
        :'advertiser_id' => :'String',
        :'url' => :'String',
        :'status' => :'String',
        :'live' => :'Boolean',
        :'connected' => :'Boolean',
        :'active' => :'Boolean',
        :'sync_enabled' => :'Boolean',
        :'account_id' => :'String',
        :'account_name' => :'String',
        :'access_type' => :'String',
        :'account_status' => :'String',
        :'headline' => :'String',
        :'name' => :'String',
        :'thumbnail_url' => :'String',
        :'currency' => :'String',
        :'markup_percent' => :'Float',
        :'booking_policy' => :'String',
        :'capacity' => :'GetVrboListing200ResponseDataInnerCapacity',
        :'bedrooms' => :'Integer',
        :'bathrooms' => :'Float',
        :'beds' => :'Integer',
        :'check_in_time' => :'String',
        :'check_out_time' => :'String',
        :'min_stay' => :'Integer',
        :'max_stay' => :'Integer',
        :'min_advance_notice_days' => :'Integer',
        :'address' => :'GetVrboListing200ResponseDataInnerAddress',
        :'rating' => :'GetVrboListing200ResponseDataInnerRating',
        :'host_name' => :'String',
        :'linked_at' => :'String',
        :'disconnected_at' => :'String',
        :'details_synced_at' => :'String',
        :'content' => :'GetVrboListing200ResponseDataInnerContent'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'unit_id',
        :'property_id',
        :'advertiser_id',
        :'url',
        :'status',
        :'account_id',
        :'account_name',
        :'access_type',
        :'account_status',
        :'headline',
        :'name',
        :'thumbnail_url',
        :'currency',
        :'markup_percent',
        :'booking_policy',
        :'bedrooms',
        :'bathrooms',
        :'beds',
        :'check_in_time',
        :'check_out_time',
        :'min_stay',
        :'max_stay',
        :'min_advance_notice_days',
        :'host_name',
        :'linked_at',
        :'disconnected_at',
        :'details_synced_at',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::GetVrboListing200ResponseDataInner` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::GetVrboListing200ResponseDataInner`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'listing_id')
        self.listing_id = attributes[:'listing_id']
      end

      if attributes.key?(:'vrbo_listing_number')
        self.vrbo_listing_number = attributes[:'vrbo_listing_number']
      end

      if attributes.key?(:'unit_id')
        self.unit_id = attributes[:'unit_id']
      end

      if attributes.key?(:'property_id')
        self.property_id = attributes[:'property_id']
      end

      if attributes.key?(:'advertiser_id')
        self.advertiser_id = attributes[:'advertiser_id']
      end

      if attributes.key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'live')
        self.live = attributes[:'live']
      end

      if attributes.key?(:'connected')
        self.connected = attributes[:'connected']
      end

      if attributes.key?(:'active')
        self.active = attributes[:'active']
      end

      if attributes.key?(:'sync_enabled')
        self.sync_enabled = attributes[:'sync_enabled']
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'account_name')
        self.account_name = attributes[:'account_name']
      end

      if attributes.key?(:'access_type')
        self.access_type = attributes[:'access_type']
      end

      if attributes.key?(:'account_status')
        self.account_status = attributes[:'account_status']
      end

      if attributes.key?(:'headline')
        self.headline = attributes[:'headline']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'thumbnail_url')
        self.thumbnail_url = attributes[:'thumbnail_url']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'markup_percent')
        self.markup_percent = attributes[:'markup_percent']
      end

      if attributes.key?(:'booking_policy')
        self.booking_policy = attributes[:'booking_policy']
      end

      if attributes.key?(:'capacity')
        self.capacity = attributes[:'capacity']
      end

      if attributes.key?(:'bedrooms')
        self.bedrooms = attributes[:'bedrooms']
      end

      if attributes.key?(:'bathrooms')
        self.bathrooms = attributes[:'bathrooms']
      end

      if attributes.key?(:'beds')
        self.beds = attributes[:'beds']
      end

      if attributes.key?(:'check_in_time')
        self.check_in_time = attributes[:'check_in_time']
      end

      if attributes.key?(:'check_out_time')
        self.check_out_time = attributes[:'check_out_time']
      end

      if attributes.key?(:'min_stay')
        self.min_stay = attributes[:'min_stay']
      end

      if attributes.key?(:'max_stay')
        self.max_stay = attributes[:'max_stay']
      end

      if attributes.key?(:'min_advance_notice_days')
        self.min_advance_notice_days = attributes[:'min_advance_notice_days']
      end

      if attributes.key?(:'address')
        self.address = attributes[:'address']
      end

      if attributes.key?(:'rating')
        self.rating = attributes[:'rating']
      end

      if attributes.key?(:'host_name')
        self.host_name = attributes[:'host_name']
      end

      if attributes.key?(:'linked_at')
        self.linked_at = attributes[:'linked_at']
      end

      if attributes.key?(:'disconnected_at')
        self.disconnected_at = attributes[:'disconnected_at']
      end

      if attributes.key?(:'details_synced_at')
        self.details_synced_at = attributes[:'details_synced_at']
      end

      if attributes.key?(:'content')
        self.content = attributes[:'content']
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
      access_type_validator = EnumAttributeValidator.new('String', ["full_access", "messaging"])
      return false unless access_type_validator.valid?(@access_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] access_type Object to be assigned
    def access_type=(access_type)
      validator = EnumAttributeValidator.new('String', ["full_access", "messaging"])
      unless validator.valid?(access_type)
        fail ArgumentError, "invalid value for \"access_type\", must be one of #{validator.allowable_values}."
      end
      @access_type = access_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          listing_id == o.listing_id &&
          vrbo_listing_number == o.vrbo_listing_number &&
          unit_id == o.unit_id &&
          property_id == o.property_id &&
          advertiser_id == o.advertiser_id &&
          url == o.url &&
          status == o.status &&
          live == o.live &&
          connected == o.connected &&
          active == o.active &&
          sync_enabled == o.sync_enabled &&
          account_id == o.account_id &&
          account_name == o.account_name &&
          access_type == o.access_type &&
          account_status == o.account_status &&
          headline == o.headline &&
          name == o.name &&
          thumbnail_url == o.thumbnail_url &&
          currency == o.currency &&
          markup_percent == o.markup_percent &&
          booking_policy == o.booking_policy &&
          capacity == o.capacity &&
          bedrooms == o.bedrooms &&
          bathrooms == o.bathrooms &&
          beds == o.beds &&
          check_in_time == o.check_in_time &&
          check_out_time == o.check_out_time &&
          min_stay == o.min_stay &&
          max_stay == o.max_stay &&
          min_advance_notice_days == o.min_advance_notice_days &&
          address == o.address &&
          rating == o.rating &&
          host_name == o.host_name &&
          linked_at == o.linked_at &&
          disconnected_at == o.disconnected_at &&
          details_synced_at == o.details_synced_at &&
          content == o.content
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, listing_id, vrbo_listing_number, unit_id, property_id, advertiser_id, url, status, live, connected, active, sync_enabled, account_id, account_name, access_type, account_status, headline, name, thumbnail_url, currency, markup_percent, booking_policy, capacity, bedrooms, bathrooms, beds, check_in_time, check_out_time, min_stay, max_stay, min_advance_notice_days, address, rating, host_name, linked_at, disconnected_at, details_synced_at, content].hash
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
