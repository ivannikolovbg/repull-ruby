# Repull::UpdateBookingContentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **property_id** | **String** | Booking.com property id. |  |
| **room_id** | **String** | A Booking.com room id, for &#x60;facilities&#x60;, &#x60;photos&#x60; (gallery) and &#x60;licences&#x60;. | [optional] |
| **text** | **String** | &#x60;description&#x60;: the property description, up to 65,535 characters. | [optional] |
| **language** | **String** | &#x60;description&#x60;: language code, e.g. &#x60;en&#x60; or &#x60;es&#x60;. | [optional] |
| **facilities** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **photos** | [**Array&lt;UpdateBookingContentRequestPhotosInner&gt;**](UpdateBookingContentRequestPhotosInner.md) |  | [optional] |
| **photo_ids** | **Array&lt;String&gt;** |  | [optional] |
| **settings** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **policy_code** | **Integer** |  | [optional] |
| **policy_id** | **String** |  | [optional] |
| **prepayment_required** | **Boolean** |  | [optional] |
| **variant_id** | **Integer** |  | [optional] |
| **content_data** | [**Array&lt;UpdateBookingContentRequestContentDataInner&gt;**](UpdateBookingContentRequestContentDataInner.md) |  | [optional] |
| **methods** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | &#x60;checkin_methods&#x60;: [{ checkin_method }]. | [optional] |
| **contacts** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::UpdateBookingContentRequest.new(
  type: null,
  property_id: null,
  room_id: null,
  text: null,
  language: null,
  facilities: null,
  photos: null,
  photo_ids: null,
  settings: null,
  policy_code: null,
  policy_id: null,
  prepayment_required: null,
  variant_id: null,
  content_data: null,
  methods: null,
  contacts: null
)
```

