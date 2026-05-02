# Repull::Review

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull review id — pass back to &#x60;/v1/reviews/{id}&#x60;. | [optional] |
| **external_id** | **String** | ID in the source channel (Airbnb review id, Booking review id, etc.). | [optional] |
| **platform** | **String** |  | [optional] |
| **listing_id** | **Integer** | Internal Repull listing id the review is attached to. | [optional] |
| **reservation_id** | **Integer** |  | [optional] |
| **reservation_confirmation_code** | **String** | Channel-side confirmation code for the reservation being reviewed. | [optional] |
| **guest_id** | **Integer** |  | [optional] |
| **guest_name** | **String** |  | [optional] |
| **guest_avatar** | **String** |  | [optional] |
| **reviewer_role** | **String** | Who wrote the review — &#x60;guest&#x60; (about the host/property) or &#x60;host&#x60; (about the guest). | [optional] |
| **rating** | **Float** | Overall rating on the platform&#39;s scale (typically 1..5). May be &#x60;null&#x60; for review types that lack a numeric overall score. | [optional] |
| **categories** | [**Array&lt;ReviewCategory&gt;**](ReviewCategory.md) |  | [optional] |
| **public_review** | **String** | Public-facing review text shown on the listing page. | [optional] |
| **private_feedback** | **String** | Private feedback the reviewer sent only to the host. | [optional] |
| **is_reviewee_recommended** | **Boolean** | Did the reviewer recommend the reviewee? Used for guest-side reviews. | [optional] |
| **response** | [**ReviewResponse**](ReviewResponse.md) |  | [optional] |
| **submitted_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **expires_at** | **Time** | When the review window closes (Airbnb has a 14-day window after checkout). | [optional] |
| **hidden** | **Boolean** |  | [optional] |
| **language** | **String** | Detected language (ISO 639-1) of the review body. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Review.new(
  id: null,
  external_id: null,
  platform: null,
  listing_id: null,
  reservation_id: null,
  reservation_confirmation_code: null,
  guest_id: null,
  guest_name: null,
  guest_avatar: null,
  reviewer_role: null,
  rating: null,
  categories: null,
  public_review: null,
  private_feedback: null,
  is_reviewee_recommended: null,
  response: null,
  submitted_at: null,
  updated_at: null,
  expires_at: null,
  hidden: null,
  language: null
)
```

