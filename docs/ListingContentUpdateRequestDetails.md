# Repull::ListingContentUpdateRequestDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **property_type** | **String** | Free-form property type; mapped to Airbnb&#39;s property-type group at publish time. | [optional] |
| **property_type_category** | **String** | Airbnb&#39;s &#x60;property_type_category&#x60;, e.g. &#x60;apartment&#x60;, &#x60;condominium&#x60;, &#x60;townhouse&#x60;. | [optional] |
| **room_type_category** | **String** | What the guest gets of the property. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequestDetails.new(
  property_type: apartment,
  property_type_category: null,
  room_type_category: null
)
```

