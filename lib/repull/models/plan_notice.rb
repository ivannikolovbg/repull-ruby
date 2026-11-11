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
  # Added to the body of EVERY JSON response (success or error, except bare arrays and 5xx) while the workspace is connected to more listings than its plan lets it use — so a developer reading any payload, or an AI assistant relaying it, sees it. Connect keeps every listing it finds, but on a capped plan only as many as the plan allows are active; the rest are held back inactive and keep syncing. The same responses also carry the `X-Repull-Listings-Held-Back` and `X-Repull-Active-Listing-Limit` headers. Using a held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`. Tell the user: they can see the held-back listings with `GET /v1/listings?status=all`, choose which are active with `POST /v1/listings/status`, or upgrade.
  class PlanNotice < ApiModelBase
    # \"listings_held_back\": some connected listings are held inactive by the plan. \"listings_over_plan\": more listings are active than the plan includes (after a downgrade). Neither blocks any call.
    attr_accessor :code

    # Active listings right now. Only when the code is \"listings_over_plan\".
    attr_accessor :active_listing_count

    # Connected listings kept inactive because of the plan.
    attr_accessor :listings_held_back

    # The plan's cap on active listings.
    attr_accessor :active_listing_limit

    attr_accessor :message

    attr_accessor :fix

    attr_accessor :billing_url

    # On a free plan: the listings Starter would serve and bill, active plus held back, across the plan's workspaces.
    attr_accessor :starter_listings

    # Starter's monthly price in USD for `starterListings` — exactly what checkout charges. Present up to 100 listings; above that the message says how to ask for a plan.
    attr_accessor :starter_monthly_price

    # Opens Starter checkout at `starterMonthlyPrice`. Present up to 100 listings.
    attr_accessor :checkout_url

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'code' => :'code',
        :'active_listing_count' => :'activeListingCount',
        :'listings_held_back' => :'listingsHeldBack',
        :'active_listing_limit' => :'activeListingLimit',
        :'message' => :'message',
        :'fix' => :'fix',
        :'billing_url' => :'billingUrl',
        :'starter_listings' => :'starterListings',
        :'starter_monthly_price' => :'starterMonthlyPrice',
        :'checkout_url' => :'checkoutUrl'
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
        :'code' => :'String',
        :'active_listing_count' => :'Integer',
        :'listings_held_back' => :'Integer',
        :'active_listing_limit' => :'Integer',
        :'message' => :'String',
        :'fix' => :'String',
        :'billing_url' => :'String',
        :'starter_listings' => :'Integer',
        :'starter_monthly_price' => :'Float',
        :'checkout_url' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'active_listing_limit',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::PlanNotice` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::PlanNotice`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'code')
        self.code = attributes[:'code']
      else
        self.code = nil
      end

      if attributes.key?(:'active_listing_count')
        self.active_listing_count = attributes[:'active_listing_count']
      end

      if attributes.key?(:'listings_held_back')
        self.listings_held_back = attributes[:'listings_held_back']
      else
        self.listings_held_back = nil
      end

      if attributes.key?(:'active_listing_limit')
        self.active_listing_limit = attributes[:'active_listing_limit']
      else
        self.active_listing_limit = nil
      end

      if attributes.key?(:'message')
        self.message = attributes[:'message']
      else
        self.message = nil
      end

      if attributes.key?(:'fix')
        self.fix = attributes[:'fix']
      else
        self.fix = nil
      end

      if attributes.key?(:'billing_url')
        self.billing_url = attributes[:'billing_url']
      else
        self.billing_url = nil
      end

      if attributes.key?(:'starter_listings')
        self.starter_listings = attributes[:'starter_listings']
      end

      if attributes.key?(:'starter_monthly_price')
        self.starter_monthly_price = attributes[:'starter_monthly_price']
      end

      if attributes.key?(:'checkout_url')
        self.checkout_url = attributes[:'checkout_url']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @code.nil?
        invalid_properties.push('invalid value for "code", code cannot be nil.')
      end

      if @listings_held_back.nil?
        invalid_properties.push('invalid value for "listings_held_back", listings_held_back cannot be nil.')
      end

      if @message.nil?
        invalid_properties.push('invalid value for "message", message cannot be nil.')
      end

      if @fix.nil?
        invalid_properties.push('invalid value for "fix", fix cannot be nil.')
      end

      if @billing_url.nil?
        invalid_properties.push('invalid value for "billing_url", billing_url cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @code.nil?
      return false if @listings_held_back.nil?
      return false if @message.nil?
      return false if @fix.nil?
      return false if @billing_url.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] code Value to be assigned
    def code=(code)
      if code.nil?
        fail ArgumentError, 'code cannot be nil'
      end

      @code = code
    end

    # Custom attribute writer method with validation
    # @param [Object] listings_held_back Value to be assigned
    def listings_held_back=(listings_held_back)
      if listings_held_back.nil?
        fail ArgumentError, 'listings_held_back cannot be nil'
      end

      @listings_held_back = listings_held_back
    end

    # Custom attribute writer method with validation
    # @param [Object] message Value to be assigned
    def message=(message)
      if message.nil?
        fail ArgumentError, 'message cannot be nil'
      end

      @message = message
    end

    # Custom attribute writer method with validation
    # @param [Object] fix Value to be assigned
    def fix=(fix)
      if fix.nil?
        fail ArgumentError, 'fix cannot be nil'
      end

      @fix = fix
    end

    # Custom attribute writer method with validation
    # @param [Object] billing_url Value to be assigned
    def billing_url=(billing_url)
      if billing_url.nil?
        fail ArgumentError, 'billing_url cannot be nil'
      end

      @billing_url = billing_url
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          code == o.code &&
          active_listing_count == o.active_listing_count &&
          listings_held_back == o.listings_held_back &&
          active_listing_limit == o.active_listing_limit &&
          message == o.message &&
          fix == o.fix &&
          billing_url == o.billing_url &&
          starter_listings == o.starter_listings &&
          starter_monthly_price == o.starter_monthly_price &&
          checkout_url == o.checkout_url
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [code, active_listing_count, listings_held_back, active_listing_limit, message, fix, billing_url, starter_listings, starter_monthly_price, checkout_url].hash
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
