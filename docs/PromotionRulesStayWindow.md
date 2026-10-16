# Repull::PromotionRulesStayWindow

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start** | **Date** |  | [optional] |
| **_end** | **Date** |  | [optional] |
| **weekdays** | **Array&lt;String&gt;** |  | [optional] |
| **excluded_dates** | **Array&lt;Date&gt;** |  | [optional] |
| **additional_dates** | **Array&lt;Date&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionRulesStayWindow.new(
  start: null,
  _end: null,
  weekdays: null,
  excluded_dates: null,
  additional_dates: null
)
```

