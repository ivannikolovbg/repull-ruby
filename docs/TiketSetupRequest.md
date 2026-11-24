# Repull::TiketSetupRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** |  |  |
| **property_id** | **String** | tiket.com Hotel ID. | [optional] |
| **partner_hotel_code** | **String** | Repull&#39;s code for a property Repull created. | [optional] |
| **listing_id** | **Integer** | &#x60;create-property&#x60;, &#x60;add-room&#x60;, &#x60;add-rate-plan&#x60;: the listing whose content is used. | [optional] |
| **hotel_id** | **String** | &#x60;set-tiket-hotel-id&#x60;: the Hotel ID tiket.com assigned. &#x60;check-activation&#x60;: the Hotel ID to check. | [optional] |
| **name** | **String** | &#x60;create-property&#x60;, &#x60;add-room&#x60;, &#x60;add-rate-plan&#x60;: name on tiket.com. | [optional] |
| **currency** | **String** | &#x60;create-property&#x60;: ISO 4217. | [optional] |
| **property_type_id** | **Integer** | &#x60;create-property&#x60;: tiket.com property type. | [optional] |
| **latitude** | **Float** |  | [optional] |
| **longitude** | **Float** |  | [optional] |
| **address** | **String** |  | [optional] |
| **postal_code** | **String** |  | [optional] |
| **country_code** | **String** |  | [optional] |
| **state_code** | **String** |  | [optional] |
| **company_name** | **String** | &#x60;create-property&#x60;: the legal entity that operates the property. | [optional] |
| **company_address** | **String** |  | [optional] |
| **star_rating** | **Float** |  | [optional] |
| **pricing_model** | **String** | &#x60;create-property&#x60;: &#x60;Room Based&#x60; or &#x60;Occupancy Based&#x60;. | [optional] |
| **description** | **String** |  | [optional] |
| **total_rooms** | **Integer** |  | [optional] |
| **floors** | **Integer** |  | [optional] |
| **when_built** | **Integer** |  | [optional] |
| **contacts** | [**Array&lt;TiketSetupRequestContactsInner&gt;**](TiketSetupRequestContactsInner.md) | &#x60;create-property&#x60;: property contacts. | [optional] |
| **quantity** | **Integer** | &#x60;add-room&#x60;: rooms of this type. | [optional] |
| **max_adults** | **Integer** |  | [optional] |
| **max_children** | **Integer** |  | [optional] |
| **room_ids** | **Array&lt;String&gt;** | &#x60;add-rate-plan&#x60;: rooms the rate plan applies to. | [optional] |
| **cancellation_policy** | **String** | &#x60;add-rate-plan&#x60;. | [optional] |
| **breakfast** | **Boolean** | &#x60;add-rate-plan&#x60;: breakfast included. | [optional] |
| **properties** | [**Array&lt;TiketSetupRequestPropertiesInner&gt;**](TiketSetupRequestPropertiesInner.md) | &#x60;request-activation&#x60;: the properties to activate. | [optional] |
| **rate_plan_ids** | **Array&lt;String&gt;** | &#x60;set-push-rate-plans&#x60;: the &#x60;ratePlanId&#x60;s that receive prices and restrictions. | [optional] |
| **enabled** | **Boolean** | &#x60;set-sync&#x60;: send calendar changes to tiket.com automatically. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketSetupRequest.new(
  action: null,
  property_id: null,
  partner_hotel_code: null,
  listing_id: null,
  hotel_id: null,
  name: null,
  currency: IDR,
  property_type_id: null,
  latitude: null,
  longitude: null,
  address: null,
  postal_code: null,
  country_code: ID,
  state_code: null,
  company_name: null,
  company_address: null,
  star_rating: null,
  pricing_model: null,
  description: null,
  total_rooms: null,
  floors: null,
  when_built: null,
  contacts: null,
  quantity: null,
  max_adults: null,
  max_children: null,
  room_ids: null,
  cancellation_policy: null,
  breakfast: null,
  properties: null,
  rate_plan_ids: null,
  enabled: null
)
```

