# Repull::Review

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Internal Repull review id — pass back to &#x60;/v1/reviews/{id}&#x60;. | [optional] |
| **external_id** | **String** | ID in the source channel (Airbnb review id, Booking review id, etc.). Pass as &#x60;review_id&#x60; to the provider reply endpoint. | [optional] |
| **platform** | **String** |  | [optional] |
| **listing_id** | **String** | Internal Repull listing id the review is attached to. | [optional] |
| **provider_property_id** | **String** | The source channel&#39;s own listing/property id for this review (Booking.com hotel/property id, Airbnb listing id, …). Pass this as &#x60;property_id&#x60; to &#x60;POST /v1/channels/booking/reviews&#x60; to post a host reply — it is the bridge from a unified review straight to the provider-specific reply call. &#x60;null&#x60; when the source listing id has not been mirrored yet. | [optional] |
| **reservation_id** | **String** |  | [optional] |
| **reservation_confirmation_code** | **String** | Channel-side confirmation code for the reservation being reviewed. | [optional] |
| **guest_id** | **String** |  | [optional] |
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
  provider_property_id: null,
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

