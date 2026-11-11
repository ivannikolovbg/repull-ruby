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
  # The Track domain and an API key + secret.
  class SubmitTrackCredentialsRequestCredentials < ApiModelBase
    # Your Track domain: `acme.trackhs.com`, or just the subdomain `acme`. A full URL is accepted; only the host is kept.
    attr_accessor :domain

    # Track API key.
    attr_accessor :api_key

    # Track API secret, shown next to the key in Track.
    attr_accessor :api_secret

    # `server` — a Server Key (Company Setup → API Keys), full access, recommended. `channel` — a Channel Key (PMS Setup → Distribution Channels), booking only.
    attr_accessor :key_type

    # How requests to Track are signed. Leave the default unless Track support told you otherwise.
    attr_accessor :auth_mode

    # HMAC realm. Defaults to `Acquia`, the realm Track's HMAC signing uses.
    attr_accessor :hmac_realm

    # Whether `apiSecret` is base64-encoded, as Track issues it. Set false to sign with the secret's raw text.
    attr_accessor :secret_is_base64

    # The Track payment type that payments recorded through this connection are posted to.
    attr_accessor :payment_type_id

    # The Track move reason used when a reservation is moved to another unit. Without it, unit changes are refused.
    attr_accessor :move_reason_id

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
        :'domain' => :'domain',
        :'api_key' => :'apiKey',
        :'api_secret' => :'apiSecret',
        :'key_type' => :'keyType',
        :'auth_mode' => :'authMode',
        :'hmac_realm' => :'hmacRealm',
        :'secret_is_base64' => :'secretIsBase64',
        :'payment_type_id' => :'paymentTypeId',
        :'move_reason_id' => :'moveReasonId'
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
        :'domain' => :'String',
        :'api_key' => :'String',
        :'api_secret' => :'String',
        :'key_type' => :'String',
        :'auth_mode' => :'String',
        :'hmac_realm' => :'String',
        :'secret_is_base64' => :'Boolean',
        :'payment_type_id' => :'Integer',
        :'move_reason_id' => :'Integer'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::SubmitTrackCredentialsRequestCredentials` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::SubmitTrackCredentialsRequestCredentials`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'domain')
        self.domain = attributes[:'domain']
      else
        self.domain = nil
      end

      if attributes.key?(:'api_key')
        self.api_key = attributes[:'api_key']
      else
        self.api_key = nil
      end

      if attributes.key?(:'api_secret')
        self.api_secret = attributes[:'api_secret']
      else
        self.api_secret = nil
      end

      if attributes.key?(:'key_type')
        self.key_type = attributes[:'key_type']
      else
        self.key_type = 'server'
      end

      if attributes.key?(:'auth_mode')
        self.auth_mode = attributes[:'auth_mode']
      else
        self.auth_mode = 'hmac'
      end

      if attributes.key?(:'hmac_realm')
        self.hmac_realm = attributes[:'hmac_realm']
      end

      if attributes.key?(:'secret_is_base64')
        self.secret_is_base64 = attributes[:'secret_is_base64']
      else
        self.secret_is_base64 = true
      end

      if attributes.key?(:'payment_type_id')
        self.payment_type_id = attributes[:'payment_type_id']
      end

      if attributes.key?(:'move_reason_id')
        self.move_reason_id = attributes[:'move_reason_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @domain.nil?
        invalid_properties.push('invalid value for "domain", domain cannot be nil.')
      end

      if @api_key.nil?
        invalid_properties.push('invalid value for "api_key", api_key cannot be nil.')
      end

      if @api_secret.nil?
        invalid_properties.push('invalid value for "api_secret", api_secret cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @domain.nil?
      return false if @api_key.nil?
      return false if @api_secret.nil?
      key_type_validator = EnumAttributeValidator.new('String', ["server", "channel"])
      return false unless key_type_validator.valid?(@key_type)
      auth_mode_validator = EnumAttributeValidator.new('String', ["hmac", "basic"])
      return false unless auth_mode_validator.valid?(@auth_mode)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] domain Value to be assigned
    def domain=(domain)
      if domain.nil?
        fail ArgumentError, 'domain cannot be nil'
      end

      @domain = domain
    end

    # Custom attribute writer method with validation
    # @param [Object] api_key Value to be assigned
    def api_key=(api_key)
      if api_key.nil?
        fail ArgumentError, 'api_key cannot be nil'
      end

      @api_key = api_key
    end

    # Custom attribute writer method with validation
    # @param [Object] api_secret Value to be assigned
    def api_secret=(api_secret)
      if api_secret.nil?
        fail ArgumentError, 'api_secret cannot be nil'
      end

      @api_secret = api_secret
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] key_type Object to be assigned
    def key_type=(key_type)
      validator = EnumAttributeValidator.new('String', ["server", "channel"])
      unless validator.valid?(key_type)
        fail ArgumentError, "invalid value for \"key_type\", must be one of #{validator.allowable_values}."
      end
      @key_type = key_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] auth_mode Object to be assigned
    def auth_mode=(auth_mode)
      validator = EnumAttributeValidator.new('String', ["hmac", "basic"])
      unless validator.valid?(auth_mode)
        fail ArgumentError, "invalid value for \"auth_mode\", must be one of #{validator.allowable_values}."
      end
      @auth_mode = auth_mode
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          domain == o.domain &&
          api_key == o.api_key &&
          api_secret == o.api_secret &&
          key_type == o.key_type &&
          auth_mode == o.auth_mode &&
          hmac_realm == o.hmac_realm &&
          secret_is_base64 == o.secret_is_base64 &&
          payment_type_id == o.payment_type_id &&
          move_reason_id == o.move_reason_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [domain, api_key, api_secret, key_type, auth_mode, hmac_realm, secret_is_base64, payment_type_id, move_reason_id].hash
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
