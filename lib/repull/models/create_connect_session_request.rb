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
  class CreateConnectSessionRequest < ApiModelBase
    # Where to send the user after they finish (or cancel). Status query params are appended.
    attr_accessor :redirect_url

    # Your own correlation token, e.g. your user id (at most 500 characters). Echoed in this response, on the redirect back (`&state=`), in the popup message, and in the `connect.session.completed` webhook.
    attr_accessor :state

    # Airbnb — how many months of past reservations the first import pulls (1–60). Omit it for the default window. Upcoming stays are always imported. A wider window takes longer to import, because every extra month is more stays to fetch.
    attr_accessor :reservation_history_months

    # Where the channel's units get linked to listings. `hosted` (default): after a Vrbo or Booking.com Extranet sign-in, Connect shows a mapping step and returns to `redirectUrl` when it's confirmed. `api`: Connect skips that step and finishes right after sign-in. The connection reaches you in the `connect.session.completed` webhook as `account.externalAccountId` (its `connectionId` is null for these two), and as `connectionId` in the popup message and `accountId` on the redirect, all the same id; its handle is `vrbo:{id}` or `booking_extranet:{id}`; you list the units with `GET /v1/connections/{id}/units` and link them with `POST /v1/connections/{id}/mappings`. Nothing is imported until you post the mappings. Other providers ignore it.
    attr_accessor :mapping

    # What the connection may do. Airbnb: the OAuth scope tier. Vrbo: `messaging` (or `read_only`) imports bookings and messages and never pushes the calendar; `full_access` also pushes prices and availability. Setting it locks the choice; omit it to let the host choose on the hosted page (default `full_access`).
    attr_accessor :access_type

    # Optional whitelist of provider IDs the picker should expose. Omit to show every channel in the registry.
    attr_accessor :allowed_providers

    # Also list PMSes Repull doesn't connect yet (`status: request-only` in `GET /v1/connect/providers?includeRequestOnly=true`), plus an Other PMS card. Picking one opens a form that collects the host's contact and access details for the Repull team and ends with \"A team member will contact you\". No connection is made: the redirect carries `status=requested&provider=<id>`, and no `connect.session.completed` webhook fires. Naming a request-only id in `allowedProviders` offers it without this flag.
    attr_accessor :include_request_only

    # Optional UI language for the hosted Connect pages. Accepts any supported locale code (currently `en`, `fr`, `de`, `es`, `it`, `nl`). When set it pins the language for the whole flow, overriding the workspace `default_language`. Unknown codes are ignored and the page falls back to the workspace default, then `Accept-Language`, then `en`. The end user can still override per-visit with a `?locale=` query param on the hosted page.
    attr_accessor :locale

    # `migrate` starts a Repull Migrate session: the property manager connects their current PMS (or channel) and their data is copied into a new workspace of theirs, which you read with `X-Workspace-Id`. The hosted pages use migration wording, and after connecting they show the import's progress.
    attr_accessor :purpose

    attr_accessor :workspace

    attr_accessor :copy

    # Migrate only — what you want brought across, listed to the property manager before they connect.
    attr_accessor :scope

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
        :'redirect_url' => :'redirectUrl',
        :'state' => :'state',
        :'reservation_history_months' => :'reservationHistoryMonths',
        :'mapping' => :'mapping',
        :'access_type' => :'accessType',
        :'allowed_providers' => :'allowedProviders',
        :'include_request_only' => :'includeRequestOnly',
        :'locale' => :'locale',
        :'purpose' => :'purpose',
        :'workspace' => :'workspace',
        :'copy' => :'copy',
        :'scope' => :'scope'
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
        :'redirect_url' => :'String',
        :'state' => :'String',
        :'reservation_history_months' => :'Integer',
        :'mapping' => :'String',
        :'access_type' => :'String',
        :'allowed_providers' => :'Array<String>',
        :'include_request_only' => :'Boolean',
        :'locale' => :'String',
        :'purpose' => :'String',
        :'workspace' => :'CreateConnectSessionRequestWorkspace',
        :'copy' => :'CreateConnectSessionRequestCopy',
        :'scope' => :'Array<String>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'state',
        :'allowed_providers',
        :'locale',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::CreateConnectSessionRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::CreateConnectSessionRequest`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'redirect_url')
        self.redirect_url = attributes[:'redirect_url']
      else
        self.redirect_url = nil
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'reservation_history_months')
        self.reservation_history_months = attributes[:'reservation_history_months']
      end

      if attributes.key?(:'mapping')
        self.mapping = attributes[:'mapping']
      else
        self.mapping = 'hosted'
      end

      if attributes.key?(:'access_type')
        self.access_type = attributes[:'access_type']
      end

      if attributes.key?(:'allowed_providers')
        if (value = attributes[:'allowed_providers']).is_a?(Array)
          self.allowed_providers = value
        end
      end

      if attributes.key?(:'include_request_only')
        self.include_request_only = attributes[:'include_request_only']
      else
        self.include_request_only = false
      end

      if attributes.key?(:'locale')
        self.locale = attributes[:'locale']
      end

      if attributes.key?(:'purpose')
        self.purpose = attributes[:'purpose']
      else
        self.purpose = 'connect'
      end

      if attributes.key?(:'workspace')
        self.workspace = attributes[:'workspace']
      end

      if attributes.key?(:'copy')
        self.copy = attributes[:'copy']
      end

      if attributes.key?(:'scope')
        if (value = attributes[:'scope']).is_a?(Array)
          self.scope = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @redirect_url.nil?
        invalid_properties.push('invalid value for "redirect_url", redirect_url cannot be nil.')
      end

      if !@reservation_history_months.nil? && @reservation_history_months > 60
        invalid_properties.push('invalid value for "reservation_history_months", must be smaller than or equal to 60.')
      end

      if !@reservation_history_months.nil? && @reservation_history_months < 1
        invalid_properties.push('invalid value for "reservation_history_months", must be greater than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @redirect_url.nil?
      return false if !@reservation_history_months.nil? && @reservation_history_months > 60
      return false if !@reservation_history_months.nil? && @reservation_history_months < 1
      mapping_validator = EnumAttributeValidator.new('String', ["hosted", "api"])
      return false unless mapping_validator.valid?(@mapping)
      access_type_validator = EnumAttributeValidator.new('String', ["full_access", "messaging", "read_only"])
      return false unless access_type_validator.valid?(@access_type)
      purpose_validator = EnumAttributeValidator.new('String', ["connect", "migrate"])
      return false unless purpose_validator.valid?(@purpose)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] redirect_url Value to be assigned
    def redirect_url=(redirect_url)
      if redirect_url.nil?
        fail ArgumentError, 'redirect_url cannot be nil'
      end

      @redirect_url = redirect_url
    end

    # Custom attribute writer method with validation
    # @param [Object] reservation_history_months Value to be assigned
    def reservation_history_months=(reservation_history_months)
      if reservation_history_months.nil?
        fail ArgumentError, 'reservation_history_months cannot be nil'
      end

      if reservation_history_months > 60
        fail ArgumentError, 'invalid value for "reservation_history_months", must be smaller than or equal to 60.'
      end

      if reservation_history_months < 1
        fail ArgumentError, 'invalid value for "reservation_history_months", must be greater than or equal to 1.'
      end

      @reservation_history_months = reservation_history_months
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] mapping Object to be assigned
    def mapping=(mapping)
      validator = EnumAttributeValidator.new('String', ["hosted", "api"])
      unless validator.valid?(mapping)
        fail ArgumentError, "invalid value for \"mapping\", must be one of #{validator.allowable_values}."
      end
      @mapping = mapping
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] access_type Object to be assigned
    def access_type=(access_type)
      validator = EnumAttributeValidator.new('String', ["full_access", "messaging", "read_only"])
      unless validator.valid?(access_type)
        fail ArgumentError, "invalid value for \"access_type\", must be one of #{validator.allowable_values}."
      end
      @access_type = access_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] purpose Object to be assigned
    def purpose=(purpose)
      validator = EnumAttributeValidator.new('String', ["connect", "migrate"])
      unless validator.valid?(purpose)
        fail ArgumentError, "invalid value for \"purpose\", must be one of #{validator.allowable_values}."
      end
      @purpose = purpose
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          redirect_url == o.redirect_url &&
          state == o.state &&
          reservation_history_months == o.reservation_history_months &&
          mapping == o.mapping &&
          access_type == o.access_type &&
          allowed_providers == o.allowed_providers &&
          include_request_only == o.include_request_only &&
          locale == o.locale &&
          purpose == o.purpose &&
          workspace == o.workspace &&
          copy == o.copy &&
          scope == o.scope
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [redirect_url, state, reservation_history_months, mapping, access_type, allowed_providers, include_request_only, locale, purpose, workspace, copy, scope].hash
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
