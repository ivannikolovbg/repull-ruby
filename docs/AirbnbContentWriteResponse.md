# Repull::AirbnbContentWriteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  |  |
| **airbnb_listing_id** | **String** | The Airbnb-side listing id the write went to. | [optional] |
| **locale** | **String** | Descriptions only — the locale written. | [optional] |
| **written** | **Array&lt;String&gt;** | Fields that were applied. |  |
| **blocked_fields** | **Array&lt;String&gt;** | Fields you sent that Airbnb refused to change. Not retryable — the content is managed on Airbnb. |  |
| **message** | **String** | Present only when &#x60;blockedFields&#x60; is non-empty: what was not applied. | [optional] |
| **fix** | **String** | Present only when &#x60;blockedFields&#x60; is non-empty: what to do about it. | [optional] |
| **result** | **Hash&lt;String, Object&gt;** | Airbnb&#39;s raw response. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbContentWriteResponse.new(
  listing_id: null,
  airbnb_listing_id: null,
  locale: null,
  written: null,
  blocked_fields: null,
  message: null,
  fix: null,
  result: null
)
```

