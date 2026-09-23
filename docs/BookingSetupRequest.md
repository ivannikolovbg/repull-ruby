# Repull::BookingSetupRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **action** | **String** |  |  |
| **listing_id** | **Integer** | Repull listing id — required for &#x60;create-property&#x60;, &#x60;add-room&#x60; and &#x60;add-unit&#x60;. NOT a Booking.com Hotel ID. &#x60;listingId&#x60; is accepted as an alias. | [optional] |
| **property_id** | **String** | Booking.com Hotel ID — required for &#x60;add-room&#x60;, &#x60;add-unit&#x60;, &#x60;advance&#x60;, and the readiness/open/contacts/policies actions. | [optional] |
| **room_id** | **Integer** | Booking.com room id — required for &#x60;add-unit&#x60;. &#x60;GET /v1/channels/booking/properties/{listingId}/rooms&#x60; lists them. &#x60;roomId&#x60; is accepted as an alias. | [optional] |
| **legal_entity_id** | **Integer** | Optional override for &#x60;create-property&#x60;. Omit it: the legal entity this workspace already uses is resolved automatically. An id that carries another workspace&#39;s properties is refused with &#x60;403 legal_entity_not_yours&#x60;. &#x60;legalEntityId&#x60; is accepted as an alias. | [optional] |
| **legal_entity** | [**BookingSetupRequestLegalEntity**](BookingSetupRequestLegalEntity.md) |  | [optional] |
| **leid** | **Integer** | Legal entity id — required for &#x60;check-legal-status&#x60;, which always answers 404. | [optional] |
| **contacts** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Contacts payload for &#x60;set-contacts&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::BookingSetupRequest.new(
  action: null,
  listing_id: null,
  property_id: null,
  room_id: null,
  legal_entity_id: null,
  legal_entity: null,
  leid: null,
  contacts: null
)
```

