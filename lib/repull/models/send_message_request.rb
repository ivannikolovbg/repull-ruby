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
  # `message`, `attachments`, or both. Per-channel limits for `attachments`:  | Channel | Accepted types | Per file | Per request | Text | |---|---|---|---|---| | Airbnb | JPEG, PNG, GIF, WebP (sent as JPEG), MP4, QuickTime | 10 MB | 5 | optional — each file is sent as its own message, then the text | | Booking.com | JPEG, PNG | 10 MB | 5 | **required** — all files ride on the one text message | | VRBO, SMS, email, direct-booking site chat | — | — | — | `422 attachments_not_supported`; nothing is sent |
  class SendMessageRequest < ApiModelBase
    # The text to send the guest. Required unless `attachments` is present.
    attr_accessor :message

    # Force a channel. Omit to send on whichever channel the conversation already uses, which is the right default. One of `airbnb`, `booking`, `vrbo`, `sms`, `email`, `website` — except on a conversation a connected PMS relays (Guesty, Hostaway, …), where the message is sent through the PMS and `channel` is passed to it: the PMS's own channel/module name (Guesty `airbnb2`, `bookingCom`, `email`, `sms`, …) or one of Repull's names, which the PMS maps. A PMS that cannot choose a channel returns `422 pms_write_unsupported`; `GET /v1/connect/{provider}` → `capabilities.pms.conversations.channelSelect` says so beforehand.
    attr_accessor :channel

    # Airbnb conversations: send as exactly this connected account — the listing's owner or one of its co-hosts — e.g. your team co-host. Never swapped for another account: if it is disconnected or not on the listing, nothing is sent and the error says why. Omit it and the conversation's own account sends while it is connected, otherwise the listing's owner, otherwise a connected co-host. Connected accounts are on `GET /v1/connect`.
    attr_accessor :account

    # Files to send. See the per-channel table above. On a conversation a connected PMS relays, files go through the PMS — `422 pms_write_unsupported` when its API cannot send them (`capabilities.pms.conversations.attachments` on `GET /v1/connect/{provider}`).
    attr_accessor :attachments

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'message' => :'message',
        :'channel' => :'channel',
        :'account' => :'account',
        :'attachments' => :'attachments'
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
        :'message' => :'String',
        :'channel' => :'String',
        :'account' => :'String',
        :'attachments' => :'Array<SendMessageAttachment>'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::SendMessageRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::SendMessageRequest`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'message')
        self.message = attributes[:'message']
      end

      if attributes.key?(:'channel')
        self.channel = attributes[:'channel']
      end

      if attributes.key?(:'account')
        self.account = attributes[:'account']
      end

      if attributes.key?(:'attachments')
        if (value = attributes[:'attachments']).is_a?(Array)
          self.attachments = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@message.nil? && @message.to_s.length > 4000
        invalid_properties.push('invalid value for "message", the character length must be smaller than or equal to 4000.')
      end

      pattern = Regexp.new(/^airbnb:\d+$/)
      if !@account.nil? && @account !~ pattern
        invalid_properties.push("invalid value for \"account\", must conform to the pattern #{pattern}.")
      end

      if !@attachments.nil? && @attachments.length > 5
        invalid_properties.push('invalid value for "attachments", number of items must be less than or equal to 5.')
      end

      if !@attachments.nil? && @attachments.length < 1
        invalid_properties.push('invalid value for "attachments", number of items must be greater than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if !@message.nil? && @message.to_s.length > 4000
      return false if !@account.nil? && @account !~ Regexp.new(/^airbnb:\d+$/)
      return false if !@attachments.nil? && @attachments.length > 5
      return false if !@attachments.nil? && @attachments.length < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] message Value to be assigned
    def message=(message)
      if message.nil?
        fail ArgumentError, 'message cannot be nil'
      end

      if message.to_s.length > 4000
        fail ArgumentError, 'invalid value for "message", the character length must be smaller than or equal to 4000.'
      end

      @message = message
    end

    # Custom attribute writer method with validation
    # @param [Object] account Value to be assigned
    def account=(account)
      if account.nil?
        fail ArgumentError, 'account cannot be nil'
      end

      pattern = Regexp.new(/^airbnb:\d+$/)
      if account !~ pattern
        fail ArgumentError, "invalid value for \"account\", must conform to the pattern #{pattern}."
      end

      @account = account
    end

    # Custom attribute writer method with validation
    # @param [Object] attachments Value to be assigned
    def attachments=(attachments)
      if attachments.nil?
        fail ArgumentError, 'attachments cannot be nil'
      end

      if attachments.length > 5
        fail ArgumentError, 'invalid value for "attachments", number of items must be less than or equal to 5.'
      end

      if attachments.length < 1
        fail ArgumentError, 'invalid value for "attachments", number of items must be greater than or equal to 1.'
      end

      @attachments = attachments
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          message == o.message &&
          channel == o.channel &&
          account == o.account &&
          attachments == o.attachments
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [message, channel, account, attachments].hash
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
