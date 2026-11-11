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
  class WebhookEventType
    RESERVATION_CREATED = "reservation.created".freeze
    RESERVATION_UPDATED = "reservation.updated".freeze
    RESERVATION_CANCELLED = "reservation.cancelled".freeze
    RESERVATION_MESSAGE_RECEIVED = "reservation.message.received".freeze
    RESERVATION_MESSAGE_SENT = "reservation.message.sent".freeze
    RESERVATION_MESSAGE_UPDATED = "reservation.message.updated".freeze
    RESERVATION_MESSAGE_READ = "reservation.message.read".freeze
    RESERVATION_MESSAGE_REACTION = "reservation.message.reaction".freeze
    RESERVATION_ALTERATION_CREATED = "reservation.alteration.created".freeze
    RESERVATION_ALTERATION_RESPONDED = "reservation.alteration.responded".freeze
    RESERVATION_REQUEST_CREATED = "reservation.request.created".freeze
    RESERVATION_REQUEST_UPDATED = "reservation.request.updated".freeze
    BOOKING_UNACKNOWLEDGED = "booking.unacknowledged".freeze
    CHANNEL_SYNC_FAILED = "channel.sync.failed".freeze
    CHANNEL_DEGRADED = "channel.degraded".freeze
    RESERVATION_THREAD_ASSIGNED = "reservation.thread.assigned".freeze
    INQUIRY_CREATED = "inquiry.created".freeze
    INQUIRY_UPDATED = "inquiry.updated".freeze
    LISTING_CREATED = "listing.created".freeze
    LISTING_UPDATED = "listing.updated".freeze
    LISTING_DELETED = "listing.deleted".freeze
    LISTING_SUSPENDED = "listing.suspended".freeze
    LISTING_REACTIVATED = "listing.reactivated".freeze
    ACCOUNT_CREATED = "account.created".freeze
    CONNECT_SESSION_COMPLETED = "connect.session.completed".freeze
    CONNECT_SESSION_ABANDONED = "connect.session.abandoned".freeze
    ACCOUNT_DISCONNECTED = "account.disconnected".freeze
    ACCOUNT_IMPORT_STARTED = "account.import.started".freeze
    ACCOUNT_IMPORT_COMPLETED = "account.import.completed".freeze
    ACCOUNT_IMPORT_FAILED = "account.import.failed".freeze
    REVIEW_CREATED = "review.created".freeze
    REVIEW_RESPONDED = "review.responded".freeze
    AI_OPERATION_COMPLETED = "ai.operation.completed".freeze
    AI_OPERATION_FAILED = "ai.operation.failed".freeze
    PAYMENT_COMPLETED = "payment.completed".freeze
    PAYMENT_REFUNDED = "payment.refunded".freeze
    PAYOUT_COMPLETED = "payout.completed".freeze
    MIGRATION_COMPLETED = "migration.completed".freeze
    MIGRATION_FAILED = "migration.failed".freeze
    REPULL_PING = "repull.ping".freeze
    USAGE_QUOTA_WARNING = "usage.quota.warning".freeze

    def self.all_vars
      @all_vars ||= [RESERVATION_CREATED, RESERVATION_UPDATED, RESERVATION_CANCELLED, RESERVATION_MESSAGE_RECEIVED, RESERVATION_MESSAGE_SENT, RESERVATION_MESSAGE_UPDATED, RESERVATION_MESSAGE_READ, RESERVATION_MESSAGE_REACTION, RESERVATION_ALTERATION_CREATED, RESERVATION_ALTERATION_RESPONDED, RESERVATION_REQUEST_CREATED, RESERVATION_REQUEST_UPDATED, BOOKING_UNACKNOWLEDGED, CHANNEL_SYNC_FAILED, CHANNEL_DEGRADED, RESERVATION_THREAD_ASSIGNED, INQUIRY_CREATED, INQUIRY_UPDATED, LISTING_CREATED, LISTING_UPDATED, LISTING_DELETED, LISTING_SUSPENDED, LISTING_REACTIVATED, ACCOUNT_CREATED, CONNECT_SESSION_COMPLETED, CONNECT_SESSION_ABANDONED, ACCOUNT_DISCONNECTED, ACCOUNT_IMPORT_STARTED, ACCOUNT_IMPORT_COMPLETED, ACCOUNT_IMPORT_FAILED, REVIEW_CREATED, REVIEW_RESPONDED, AI_OPERATION_COMPLETED, AI_OPERATION_FAILED, PAYMENT_COMPLETED, PAYMENT_REFUNDED, PAYOUT_COMPLETED, MIGRATION_COMPLETED, MIGRATION_FAILED, REPULL_PING, USAGE_QUOTA_WARNING].freeze
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      return value if WebhookEventType.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #WebhookEventType"
    end
  end
end
