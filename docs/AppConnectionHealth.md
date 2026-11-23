# Repull::AppConnectionHealth

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | &#x60;active&#x60;: a successful price or minimum-stay push in the last 24 hours. &#x60;idle&#x60;: the app connected before but has not pushed in the last 24 hours. &#x60;failing&#x60;: more than 25% of the last 24 hours&#39; requests failed (at least 5 requests); read &#x60;recentErrors&#x60;. &#x60;never_connected&#x60;: the app has not used the key yet. |  |
| **last_request_at** | **Time** | The app&#39;s last request with the key, of any kind. | [optional] |
| **last_successful_write_at** | **Time** | The app&#39;s last successful price or minimum-stay push. | [optional] |
| **writes_per_day** | [**Array&lt;AppConnectionHealthWritesPerDayInner&gt;**](AppConnectionHealthWritesPerDayInner.md) | Successful price and minimum-stay pushes per UTC day, the last 7 days, oldest first. |  |
| **requests24h** | **Integer** |  | [optional] |
| **errors24h** | **Integer** |  | [optional] |
| **error_rate24h** | **Float** | &#x60;errors24h / requests24h&#x60;; 0 when there were no requests. | [optional] |
| **requests7d** | **Integer** |  | [optional] |
| **errors7d** | **Integer** |  | [optional] |
| **error_rate7d** | **Float** |  | [optional] |
| **recent_errors** | [**Array&lt;AppConnectionHealthRecentErrorsInner&gt;**](AppConnectionHealthRecentErrorsInner.md) | The 10 most recent failed requests, newest first. |  |

## Example

```ruby
require 'repull'

instance = Repull::AppConnectionHealth.new(
  status: null,
  last_request_at: null,
  last_successful_write_at: null,
  writes_per_day: null,
  requests24h: null,
  errors24h: null,
  error_rate24h: 0.02,
  requests7d: null,
  errors7d: null,
  error_rate7d: 0.01,
  recent_errors: null
)
```

