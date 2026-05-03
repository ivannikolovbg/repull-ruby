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
  retry_after: 60,
  support: null
)
```

