# Repull::TiketProperty

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_id** | **String** | tiket.com Hotel ID. &#x60;null&#x60; for a property Repull created that tiket.com has not assigned an id to yet. | [optional] |
| **partner_hotel_code** | **String** | Repull&#39;s code for a property Repull created on tiket.com. | [optional] |
| **name** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **price_model** | **String** | &#x60;Room Based&#x60; (one &#x60;price&#x60; per night) or &#x60;Occupancy Based&#x60; (&#x60;occupancyPrices&#x60; per number of guests). Set per property in the tiket.com extranet. | [optional] |
| **activation_status** | **String** | Whether tiket.com has activated Repull as the property&#39;s channel manager, &#x60;awaiting_activation&#x60; until tiket.com activates Repull, then &#x60;active&#x60;; &#x60;disconnected&#x60; after &#x60;disconnect&#x60;. | [optional] |
| **content_mapped** | **Boolean** | &#x60;true&#x60; when tiket.com has linked Repull&#39;s codes to the property, so &#x60;POST /v1/listings/{id}/publish/tiket&#x60; can send content. | [optional] |
| **sync_enabled** | **Boolean** | Whether calendar changes are sent to tiket.com automatically (&#x60;set-sync&#x60;). | [optional] |
| **last_products_at** | **Time** | When room types and rate plans were last read from tiket.com. | [optional] |
| **last_error** | **String** |  | [optional] |
| **mapping_status** | **String** | &#x60;mapped&#x60; — every room type has a listing; &#x60;partial&#x60; — some do; &#x60;unmapped&#x60; — none (a real onboarding state, not an error). | [optional] |
| **listings** | [**Array&lt;TiketPropertyListingsInner&gt;**](TiketPropertyListingsInner.md) |  | [optional] |
| **rooms** | [**Array&lt;TiketRoom&gt;**](TiketRoom.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketProperty.new(
  property_id: null,
  partner_hotel_code: null,
  name: null,
  currency: IDR,
  price_model: Room Based,
  activation_status: null,
  content_mapped: null,
  sync_enabled: null,
  last_products_at: null,
  last_error: null,
  mapping_status: null,
  listings: null,
  rooms: null
)
```

