# Repull::ErrorError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | Stable machine-parseable error identifier. Match on this for retry logic. Codes are namespaced and never change meaning. |  |
| **message** | **String** | Human-readable cause. Echoes the offending value when relevant. |  |
| **fix** | **String** | Exact recovery steps. Surface this verbatim in your UI / agent reasoning trace — it is written to be actionable without further reading. |  |
| **docs_url** | **String** | Canonical write-up for this error code. URL pattern: &#x60;https://repull.dev/docs/errors/{code}&#x60;. |  |
| **request_id** | **String** | Opaque per-request id. Mirrors the &#x60;x-request-id&#x60; response header. Capture it before retrying so logs can be correlated. |  |
| **field** | **String** | Body field, query param, or path segment the error is about. Present when the error is parameter-specific. | [optional] |
| **value_received** | **Object** | Echo of the offending value (truncated to 200 chars). Useful for debugging — helps callers see what the server actually parsed. | [optional] |
| **valid_values** | **Array&lt;String&gt;** | Allowed values when the error is enum-related (e.g. unknown &#x60;provider&#x60;, unknown &#x60;status&#x60;). | [optional] |
| **valid_params** | **Array&lt;String&gt;** | Sorted list of every query param this endpoint accepts. Present on &#x60;code: \&quot;unknown_params\&quot;&#x60; (HTTP 422) so SDK consumers can self-correct without reading docs. | [optional] |
| **endpoint** | **String** | The endpoint path that produced the error. Present on &#x60;code: \&quot;unknown_params\&quot;&#x60; so consumers can match validation failures to the operation they invoked. | [optional] |
| **did_you_mean** | **String** | Suggestion for typos and near-matches. Present when the server can guess the intent. | [optional] |
| **previous_code** | **String** | The &#x60;code&#x60; THIS response used to carry, for callers whose branch still matches the old string. A migration aid with a deprecation window — **&#x60;code&#x60; is canonical, always match on that.**  Present only where an endpoint&#39;s classification actually changed, never as a permanent synonym, and it disappears from a response as soon as the canonical code and the old one agree.  The live case: the reviews, messaging, check-in-guide, alteration-answer and Airbnb-pull endpoints used to report EVERY Airbnb failure as &#x60;500 airbnb_error&#x60;, including refusals Airbnb will repeat forever. They now classify the same way every other Airbnb write does — an Airbnb 4xx is &#x60;422 airbnb_rejected&#x60; (fix the request), 5xx and timeouts stay &#x60;502 airbnb_error&#x60; (retry with backoff), and a dead grant is &#x60;403 connection_reauth_required&#x60;. Those responses carry &#x60;previous_code: \&quot;airbnb_error\&quot;&#x60;. **Removed in v2** — migrate your branches to &#x60;code&#x60; before then. | [optional] |
| **listing_ids** | **Array&lt;String&gt;** | Every inactive listing the request involved. Present on &#x60;code: \&quot;listing_inactive\&quot;&#x60; (HTTP 403) — activate these ids and retry. | [optional] |
| **listing_id** | **String** | The single Repull listing the error is about. Present on &#x60;code: \&quot;listing_not_api_connected\&quot;&#x60; (HTTP 403). | [optional] |
| **airbnb_listing_id** | **String** | Airbnb&#39;s own id for that listing, so the host can find it in Airbnb. Present on &#x60;code: \&quot;listing_not_api_connected\&quot;&#x60; (HTTP 403). | [optional] |
| **sync_category** | **String** | The listing&#39;s current Airbnb API sync category — why the write was refused. Present on &#x60;code: \&quot;listing_not_api_connected\&quot;&#x60; (HTTP 403). | [optional] |
| **retry_after** | **Integer** | Seconds the client should wait before retrying. Mirrors the &#x60;Retry-After&#x60; HTTP header. Present on rate-limit responses and on transient upstream failures that are safe to retry. | [optional] |
| **support** | [**ErrorErrorSupport**](ErrorErrorSupport.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ErrorError.new(
  code: invalid_params,
  message: The check_in_after parameter must be an ISO 8601 date (YYYY-MM-DD or YYYY-MM-DDTHH:mm:ssZ). You sent: &#39;garbage&#39;.,
  fix: Pass check_in_after as a string in ISO 8601 format. Example: ?check_in_after&#x3D;2026-01-15,
  docs_url: https://repull.dev/docs/errors/invalid_params,
  request_id: req_01J5X7Y8Z9ABCDEF12345678,
  field: check_in_after,
  value_received: garbage,
  valid_values: [&quot;airbnb&quot;,&quot;booking&quot;,&quot;vrbo&quot;,&quot;plumguide&quot;],
  valid_params: [&quot;cursor&quot;,&quot;has_reservation&quot;,&quot;include_total&quot;,&quot;limit&quot;,&quot;listingId&quot;,&quot;q&quot;],
  endpoint: /v1/guests,
  did_you_mean: check_in_after,
  previous_code: airbnb_error,
  listing_ids: [&quot;4118&quot;],
  listing_id: 23901,
  airbnb_listing_id: 22616426,
  sync_category: none,
  retry_after: 60,
  support: null
)
```

