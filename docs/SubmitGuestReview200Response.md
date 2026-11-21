# Repull::SubmitGuestReview200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **external_review_id** | **String** |  | [optional] |
| **submitted** | **Boolean** |  | [optional] |
| **platform** | **String** | &#x60;vrbo&#x60; for a Vrbo rating. | [optional] |
| **rating** | **Hash&lt;String, Object&gt;** | Vrbo: the rating as sent to Vrbo. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitGuestReview200Response.new(
  id: null,
  external_review_id: null,
  submitted: null,
  platform: null,
  rating: null
)
```

