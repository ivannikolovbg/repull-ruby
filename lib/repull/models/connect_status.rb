=begin
#Repull API

#The unified API for vacation rental tech. Connect Airbnb, Booking.com, Vrbo and more channels, plus 14 PMS platforms, through one REST API.  ## Designed for AI agents Every error response on this API includes machine-parseable fields so an LLM (Claude in MCP, Cursor, Cline, GPT, etc.) can self-recover without escalating to a human: - `error.code` — stable string identifier (e.g. `invalid_params`, `rate_limit_exceeded`) - `error.message` — human-readable cause - `error.fix` — exact recovery steps (e.g. \"Pass `check_in_after` as ISO 8601: `?check_in_after=2026-01-15`\") - `error.docs_url` — link to the canonical write-up at `https://repull.dev/docs/errors/{code}` - `error.request_id` — id to correlate with server-side logs - `error.field` / `error.value_received` / `error.valid_values` / `error.did_you_mean` — when the error is parameter-specific - `error.retry_after` — seconds to wait before retrying (rate-limit + transient upstream)  `Access-Control-Expose-Headers` lists `x-request-id` and the `X-RateLimit-*` family so browsers can read them on cross-origin responses.  ## Quick Start 1. Get an API key at https://repull.dev/dashboard 2. Connect a PMS: `POST /v1/connect/{provider}` 3. List properties: `GET /v1/properties` 4. Get reservations: `GET /v1/reservations`  ## Authentication All requests require a Bearer token: ``` Authorization: Bearer sk_live_YOUR_API_KEY ```  ## Request Correlation (X-Request-ID) Every response carries an `X-Request-ID` header, e.g. `X-Request-ID: req_01HXY...`. Include this id in support tickets and bug reports — we can trace the full request lifecycle (auth, rate limit, handler, downstream calls, log row) from a single id.  You may set the header on the inbound request to forward your own trace id; we will echo it back instead of generating a new one. Accepted format: `^[\\\\w.-]{1,128}$`.  The id is also embedded in error envelopes as `request_id` so server-side log diffs work even when the response headers are stripped by an intermediate proxy.  ## Rate Limits The public API enforces a per-API-key sliding-window rate limit on top of the per-tier monthly + daily-AI quotas.  **Default policy:** 600 requests per 60 seconds, per API key. Sliding window — there is no fixed-minute boundary you can burst across.  Every response includes:  | Header | Meaning | |---|---| | `X-RateLimit-Limit` | Requests permitted in the current window. | | `X-RateLimit-Remaining` | Requests left in the current window after this call. | | `X-RateLimit-Reset` | Unix epoch (seconds) when the next slot opens. | | `X-RateLimit-Policy` | Machine-readable policy descriptor, e.g. `600;w=60`. | | `Retry-After` | Seconds to wait before retrying. **Only present on 429 responses.** |  **On 429 (rate_limit_exceeded):** the response body matches the standard error envelope with `code: \"rate_limit_exceeded\"`, plus `limit`, `window_seconds`, `retry_after`, and `request_id` fields. SDKs MUST honor `Retry-After` and use exponential backoff with jitter on subsequent retries — never a tight loop.  Recommended backoff: ``` sleep_ms = (Retry-After * 1000) + random(0..250) ```  Monthly + daily-AI tier quotas (`free`, `starter`, `custom`) are enforced separately and also surface as 429s; they include `tier`, `scope`, `limit`, `used` and `resets_at` fields.  **The way past a request quota.** The monthly quota refusal (`429 rate_limit_exceeded` with `scope: \"monthly\"`), `402 credits_exhausted` and `429 daily_limit_exceeded` also carry `upgrade` (the cheapest plan that covers your usage: its exact monthly price for your listings, its request quotas and a `checkout_url` that opens checkout for that price; `plan: \"custom\"` with a `contact_email` when no self-serve plan covers it), `credits` (pay-as-you-go: `usd_per_1000_requests`, `top_up_url`, your `balance_usd`), `resets_at` and `projected_monthly_requests`. The per-minute 429 (`scope: \"per_api_key\"`) carries none of these: wait `Retry-After`.  ## Plan listing limits Each plan includes a number of **active listings**:  | Tier | Active listings | |---|---| | `free` | 3 | | `starter` | no cap: 10 included, then billed per listing | | `custom` | no cap |  Going over the plan never blocks your API calls. Listings beyond the plan are **held back**: they stay connected and keep syncing, but they are not served. A held-back listing answers `403 listing_inactive` with `reason: \"plan_limit\"`, and collection routes leave it out. Every JSON response then carries a `planNotice` and the `X-Repull-Listings-Held-Back` header, so you know there is more to see.  Choose which listings are active with `POST /v1/listings/status`. Upgrading at `https://repull.dev/dashboard/billing` lifts the cap but does not switch held-back listings on: you choose which to activate afterwards, with the same call or from the dashboard, and each one you switch on is billed from then.  Only a call that would itself take you over the plan is refused, with **`402 listings_limit_exceeded`**: activating listings (`PATCH /v1/listings/{id}` with `{ \"active\": true }`, `POST /v1/listings/status`) or creating one (`POST /v1/listings`). Nothing else changes. The envelope carries the tier, the limit, the active count and an upgrade link next to the standard `code` / `message` / `fix` / `docs_url` / `request_id`.  If an account has more active listings than its plan (for example after a downgrade), calls are still served and `planNotice` says so (code \"listings_over_plan\").

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.22.0

=end

require 'date'
require 'time'

module Repull
  # Connection status response for a single provider. When `connected` is false, all other fields except `provider` and `host` may be omitted, and `host` is null.
  class ConnectStatus < ApiModelBase
    attr_accessor :connected

    attr_accessor :provider

    # Repull-side connection ID (the `X-Account-Id`). Stable across token refreshes.
    attr_accessor :id

    # Same as `id`: our connection record.
    attr_accessor :connection_id

    attr_accessor :status

    # The platform's own account id: Airbnb host id; Booking.com hotel id (`booking`); the Booking.com account id behind the Extranet login (`booking_extranet`); Vrbo's account id (`vrbo`); the PMS's own account or company id. `null` when the platform id is not known yet (a Vrbo sign-in before its account id is captured, a PMS that does not expose one); never a Repull id.
    attr_accessor :external_account_id

    attr_accessor :created_at

    # Host metadata, populated for Airbnb when the host row exists. Null for other providers (per-provider enrichment is incremental).
    attr_accessor :host

    # Airbnb: every Airbnb account this workspace has connected, including ones since disconnected. Pass `externalAccountId` as `accountId` to `DELETE /v1/connect/airbnb` to disconnect one account. Vrbo (`GET /v1/connect/vrbo-login`): every signed-in Vrbo account, each with `accessType` and `import` (a `VrboImportStatus`), plus a top-level `dataFreshness`. `externalAccountId` is the platform's own id (Airbnb host id, Vrbo account id; `null` for a Vrbo sign-in whose account id is not captured yet) and `connectionId` our connection record.
    attr_accessor :accounts

    # PMS connections only: what the app may change in the PMS. Change it with `PATCH /v1/connect/{provider}/write-policy`.
    attr_accessor :write_policy

    attr_accessor :capabilities

    # Vrbo only: the same freshness envelope the Airbnb read endpoints return, per account and in aggregate. Its reason is never_synced until a mapping is confirmed and importing while upcoming bookings come in.
    attr_accessor :data_freshness

    # Smoobu only: set to `{ required: true, reason: \"reauth_required\", message }` when the connection still uses a legacy single API key, which Smoobu stops accepting on October 31, 2026. `null` once it is on an API key + secret.
    attr_accessor :action

    # Smoobu only: durable link to the hosted Smoobu form where the host pastes a new API key + secret. Submitting it updates this same connection (`id` unchanged). Present only when `action.required` is true.
    attr_accessor :fix_url

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'connected' => :'connected',
        :'provider' => :'provider',
        :'id' => :'id',
        :'connection_id' => :'connectionId',
        :'status' => :'status',
        :'external_account_id' => :'externalAccountId',
        :'created_at' => :'createdAt',
        :'host' => :'host',
        :'accounts' => :'accounts',
        :'write_policy' => :'writePolicy',
        :'capabilities' => :'capabilities',
        :'data_freshness' => :'dataFreshness',
        :'action' => :'action',
        :'fix_url' => :'fixUrl'
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
        :'connected' => :'Boolean',
        :'provider' => :'String',
        :'id' => :'String',
        :'connection_id' => :'String',
        :'status' => :'String',
        :'external_account_id' => :'String',
        :'created_at' => :'Time',
        :'host' => :'ConnectHost',
        :'accounts' => :'Array<ConnectStatusAccountsInner>',
        :'write_policy' => :'PmsWritePolicy',
        :'capabilities' => :'ConnectStatusCapabilities',
        :'data_freshness' => :'Object',
        :'action' => :'ConnectionAction',
        :'fix_url' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'external_account_id',
        :'host',
        :'action',
        :'fix_url'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::ConnectStatus` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::ConnectStatus`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'connected')
        self.connected = attributes[:'connected']
      end

      if attributes.key?(:'provider')
        self.provider = attributes[:'provider']
      end

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'connection_id')
        self.connection_id = attributes[:'connection_id']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'external_account_id')
        self.external_account_id = attributes[:'external_account_id']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'host')
        self.host = attributes[:'host']
      end

      if attributes.key?(:'accounts')
        if (value = attributes[:'accounts']).is_a?(Array)
          self.accounts = value
        end
      end

      if attributes.key?(:'write_policy')
        self.write_policy = attributes[:'write_policy']
      end

      if attributes.key?(:'capabilities')
        self.capabilities = attributes[:'capabilities']
      end

      if attributes.key?(:'data_freshness')
        self.data_freshness = attributes[:'data_freshness']
      end

      if attributes.key?(:'action')
        self.action = attributes[:'action']
      end

      if attributes.key?(:'fix_url')
        self.fix_url = attributes[:'fix_url']
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
          connected == o.connected &&
          provider == o.provider &&
          id == o.id &&
          connection_id == o.connection_id &&
          status == o.status &&
          external_account_id == o.external_account_id &&
          created_at == o.created_at &&
          host == o.host &&
          accounts == o.accounts &&
          write_policy == o.write_policy &&
          capabilities == o.capabilities &&
          data_freshness == o.data_freshness &&
          action == o.action &&
          fix_url == o.fix_url
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [connected, provider, id, connection_id, status, external_account_id, created_at, host, accounts, write_policy, capabilities, data_freshness, action, fix_url].hash
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
