# Repull::Promotion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull id of this promotion on this listing (use it in &#x60;/promotions/{promotionId}&#x60;). | [optional] |
| **listing_id** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **type** | [**PromotionType**](PromotionType.md) |  | [optional] |
| **channel_type** | **String** | The channel’s own name, e.g. &#x60;HIGH_RATED_GUEST_DISCOUNT&#x60;, &#x60;basic&#x60;, &#x60;campaign_getaway&#x60;. | [optional] |
| **external_id** | **String** | The channel’s promotion id. Booking.com may issue a new one when a promotion is changed; the Repull &#x60;id&#x60; stays the same. | [optional] |
| **channel_property_id** | **String** | Airbnb listing id, or the Booking.com property (hotel id) the promotion belongs to. | [optional] |
| **name** | **String** |  | [optional] |
| **status** | **String** | &#x60;eligible&#x60;: the listing qualifies but is not enrolled (Airbnb new listing promotion). &#x60;inactive&#x60;: switched off; Booking.com keeps deactivated promotions. | [optional] |
| **managed_by** | **String** | &#x60;channel&#x60;: created in the channel’s own tools and read-only here (Airbnb Custom promotions). | [optional] |
| **managed_key** | **String** | Set when it comes from the listing’s weekly or monthly discount in its pricing settings — change those instead. | [optional] |
| **editable** | **Boolean** |  | [optional] |
| **removable** | **Boolean** |  | [optional] |
| **discount** | [**PromotionDiscount**](PromotionDiscount.md) |  | [optional] |
| **rules** | [**PromotionRules**](PromotionRules.md) |  | [optional] |
| **applies_to** | [**PromotionAppliesTo**](PromotionAppliesTo.md) |  | [optional] |
| **usage** | [**PromotionUsage**](PromotionUsage.md) |  | [optional] |
| **expires_at** | **Time** |  | [optional] |
| **synced_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Promotion.new(
  id: null,
  listing_id: null,
  channel: null,
  type: null,
  channel_type: null,
  external_id: null,
  channel_property_id: null,
  name: null,
  status: null,
  managed_by: null,
  managed_key: null,
  editable: null,
  removable: null,
  discount: null,
  rules: null,
  applies_to: null,
  usage: null,
  expires_at: null,
  synced_at: null
)
```

