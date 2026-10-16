# Repull::PromotionRules

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **campaign** | **String** | Booking.com campaigns: &#x60;black_friday&#x60;, &#x60;getaway&#x60;, &#x60;late_escape&#x60;, &#x60;early_year&#x60;. | [optional] |
| **audience** | **String** | &#x60;public&#x60;, &#x60;subscribers&#x60; (members only, at least 10%), &#x60;app&#x60;, &#x60;all&#x60; (app and mobile web), or a country id from the catalog (e.g. &#x60;united_kingdom_pos&#x60;). | [optional] |
| **stay_window** | [**PromotionRulesStayWindow**](PromotionRulesStayWindow.md) |  | [optional] |
| **booking_window** | [**PromotionRulesBookingWindow**](PromotionRulesBookingWindow.md) |  | [optional] |
| **last_minute** | [**PromotionRulesLastMinute**](PromotionRulesLastMinute.md) |  | [optional] |
| **early_booker_days** | **Integer** |  | [optional] |
| **min_nights** | **Integer** |  | [optional] |
| **non_refundable** | **Boolean** |  | [optional] |
| **blackout_dates** | **Array&lt;Date&gt;** | Airbnb — not yet available. | [optional] |
| **blackout_dates_quota** | [**PromotionRulesBlackoutDatesQuota**](PromotionRulesBlackoutDatesQuota.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PromotionRules.new(
  campaign: null,
  audience: null,
  stay_window: null,
  booking_window: null,
  last_minute: null,
  early_booker_days: null,
  min_nights: null,
  non_refundable: null,
  blackout_dates: null,
  blackout_dates_quota: null
)
```

