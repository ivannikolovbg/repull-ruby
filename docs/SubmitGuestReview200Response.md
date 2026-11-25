# Repull::SubmitGuestReview200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **external_review_id** | **String** |  | [optional] |
| **submitted** | **Boolean** |  | [optional] |
| **review** | **Hash&lt;String, Object&gt;** | Airbnb: the review as stored after the submission — the same object &#x60;GET /v1/reviews/{id}&#x60; returns, with &#x60;publicReview&#x60;, &#x60;rating&#x60;, &#x60;categories&#x60; and &#x60;submittedAt&#x60; set. It can stay &#x60;hidden&#x60; until the guest reviews too. | [optional] |
| **platform** | **String** | &#x60;vrbo&#x60; for a Vrbo rating. | [optional] |
| **rating** | **Hash&lt;String, Object&gt;** | Vrbo: the rating as sent to Vrbo. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitGuestReview200Response.new(
  id: null,
  external_review_id: null,
  submitted: null,
  review: null,
  platform: null,
  rating: null
)
```

