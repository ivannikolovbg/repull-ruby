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
  # Your review of a guest. Airbnb requires `publicReview`, `isRevieweeRecommended`, and a rating for each of cleanliness, communication and respect_house_rules — through `rating`, `categoryRatings`, or both. Submitting publishes it and is final.
  class AirbnbHostReviewSubmit < ApiModelBase
    # Shown publicly on the guest's profile. `comment` is accepted as an alias.
    attr_accessor :public_review

    # Used for every category not rated in `categoryRatings`.
    attr_accessor :rating

    # Per-category scores. Categories not listed take `rating`; without `rating`, all three must be listed.
    attr_accessor :category_ratings

    # Optional. A note to the guest that is not published.
    attr_accessor :private_feedback

    # Required. Whether you would host this guest again.
    attr_accessor :is_reviewee_recommended

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'public_review' => :'publicReview',
        :'rating' => :'rating',
        :'category_ratings' => :'categoryRatings',
        :'private_feedback' => :'privateFeedback',
        :'is_reviewee_recommended' => :'isRevieweeRecommended'
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
        :'public_review' => :'String',
        :'rating' => :'Integer',
        :'category_ratings' => :'Array<AirbnbHostReviewSubmitCategoryRatingsInner>',
        :'private_feedback' => :'String',
        :'is_reviewee_recommended' => :'Boolean'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Repull::AirbnbHostReviewSubmit` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Repull::AirbnbHostReviewSubmit`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'public_review')
        self.public_review = attributes[:'public_review']
      else
        self.public_review = nil
      end

      if attributes.key?(:'rating')
        self.rating = attributes[:'rating']
      end

      if attributes.key?(:'category_ratings')
        if (value = attributes[:'category_ratings']).is_a?(Array)
          self.category_ratings = value
        end
      end

      if attributes.key?(:'private_feedback')
        self.private_feedback = attributes[:'private_feedback']
      end

      if attributes.key?(:'is_reviewee_recommended')
        self.is_reviewee_recommended = attributes[:'is_reviewee_recommended']
      else
        self.is_reviewee_recommended = nil
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @public_review.nil?
        invalid_properties.push('invalid value for "public_review", public_review cannot be nil.')
      end

      if @public_review.to_s.length > 1000
        invalid_properties.push('invalid value for "public_review", the character length must be smaller than or equal to 1000.')
      end

      if !@rating.nil? && @rating > 5
        invalid_properties.push('invalid value for "rating", must be smaller than or equal to 5.')
      end

      if !@rating.nil? && @rating < 1
        invalid_properties.push('invalid value for "rating", must be greater than or equal to 1.')
      end

      if !@private_feedback.nil? && @private_feedback.to_s.length > 1000
        invalid_properties.push('invalid value for "private_feedback", the character length must be smaller than or equal to 1000.')
      end

      if @is_reviewee_recommended.nil?
        invalid_properties.push('invalid value for "is_reviewee_recommended", is_reviewee_recommended cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @public_review.nil?
      return false if @public_review.to_s.length > 1000
      return false if !@rating.nil? && @rating > 5
      return false if !@rating.nil? && @rating < 1
      return false if !@private_feedback.nil? && @private_feedback.to_s.length > 1000
      return false if @is_reviewee_recommended.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] public_review Value to be assigned
    def public_review=(public_review)
      if public_review.nil?
        fail ArgumentError, 'public_review cannot be nil'
      end

      if public_review.to_s.length > 1000
        fail ArgumentError, 'invalid value for "public_review", the character length must be smaller than or equal to 1000.'
      end

      @public_review = public_review
    end

    # Custom attribute writer method with validation
    # @param [Object] rating Value to be assigned
    def rating=(rating)
      if rating.nil?
        fail ArgumentError, 'rating cannot be nil'
      end

      if rating > 5
        fail ArgumentError, 'invalid value for "rating", must be smaller than or equal to 5.'
      end

      if rating < 1
        fail ArgumentError, 'invalid value for "rating", must be greater than or equal to 1.'
      end

      @rating = rating
    end

    # Custom attribute writer method with validation
    # @param [Object] private_feedback Value to be assigned
    def private_feedback=(private_feedback)
      if private_feedback.nil?
        fail ArgumentError, 'private_feedback cannot be nil'
      end

      if private_feedback.to_s.length > 1000
        fail ArgumentError, 'invalid value for "private_feedback", the character length must be smaller than or equal to 1000.'
      end

      @private_feedback = private_feedback
    end

    # Custom attribute writer method with validation
    # @param [Object] is_reviewee_recommended Value to be assigned
    def is_reviewee_recommended=(is_reviewee_recommended)
      if is_reviewee_recommended.nil?
        fail ArgumentError, 'is_reviewee_recommended cannot be nil'
      end

      @is_reviewee_recommended = is_reviewee_recommended
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          public_review == o.public_review &&
          rating == o.rating &&
          category_ratings == o.category_ratings &&
          private_feedback == o.private_feedback &&
          is_reviewee_recommended == o.is_reviewee_recommended
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [public_review, rating, category_ratings, private_feedback, is_reviewee_recommended].hash
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
