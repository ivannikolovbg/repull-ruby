# Repull::ListingContentUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **locale** | **String** | Which language the &#x60;title&#x60; / &#x60;description&#x60; / &#x60;summary&#x60; / &#x60;policies.houseRules&#x60; in THIS request are written in. Defaults to &#x60;en&#x60;. Canonical content is stored per locale — one row per (listing, locale) — so sending Italian copy with &#x60;locale: \&quot;it\&quot;&#x60; creates or updates the Italian row instead of overwriting the English one. Distribution of a non-primary locale to Airbnb is a separate call: &#x60;PUT /v1/channels/airbnb/listings/{id}/descriptions&#x60;. | [optional] |
| **title** | **String** | Guest-facing title. Written to the listing name and the description row for &#x60;locale&#x60;. | [optional] |
| **name** | **String** | Alias for &#x60;title&#x60;. | [optional] |
| **description** | **String** | Long-form listing description. | [optional] |
| **summary** | **String** | Short summary / tagline. | [optional] |
| **amenities** | [**ListingContentUpdateRequestAmenities**](ListingContentUpdateRequestAmenities.md) |  | [optional] |
| **address** | [**ListingContentUpdateRequestAddress**](ListingContentUpdateRequestAddress.md) |  | [optional] |
| **details** | [**ListingContentUpdateRequestDetails**](ListingContentUpdateRequestDetails.md) |  | [optional] |
| **occupancy** | [**ListingContentUpdateRequestOccupancy**](ListingContentUpdateRequestOccupancy.md) |  | [optional] |
| **rooms** | [**Array&lt;ListingContentUpdateRequestRoomsInner&gt;**](ListingContentUpdateRequestRoomsInner.md) | The listing&#39;s rooms and the beds in each — what Airbnb shows as the sleeping arrangements and needs before a listing can go live. FULL replacement: the rooms you send become the whole set. Omit to leave rooms untouched; send &#x60;[]&#x60; to clear them.  Every entry is checked before anything is written, so a bad entry refuses the whole request with &#x60;422 invalid_params&#x60; naming it (e.g. &#x60;rooms[1].beds[0].quantity&#x60;) — a listing is never left with half its rooms.  Values use Airbnb&#39;s vocabulary, which Booking.com room mapping also reads. This is a local write; publish to send it to a channel. | [optional] |
| **checkout_tasks** | [**Array&lt;ListingContentUpdateRequestCheckoutTasksInner&gt;**](ListingContentUpdateRequestCheckoutTasksInner.md) | What the guest is asked to do before leaving. FULL replacement: omit to leave untouched; send &#x60;[]&#x60; to clear. An unknown &#x60;taskType&#x60; refuses the whole request with &#x60;422 invalid_params&#x60;.  Published to Airbnb, which is the only channel with checkout tasks. Airbnb accepts them only from partner apps it has certified for the feature; until then the publish result reports Airbnb&#39;s own refusal for this section and every other section still lands. | [optional] |
| **pricing** | [**ListingContentUpdateRequestPricing**](ListingContentUpdateRequestPricing.md) |  | [optional] |
| **policies** | [**ListingContentUpdateRequestPolicies**](ListingContentUpdateRequestPolicies.md) |  | [optional] |
| **photos** | [**Array&lt;ListingContentUpdateRequestPhotosInner&gt;**](ListingContentUpdateRequestPhotosInner.md) | Photo set — full replacement by default (pass &#x60;photosMode: \&quot;append\&quot;&#x60; to add after existing photos, or &#x60;[]&#x60; to clear; omit to leave untouched). Each entry is a hosted image URL (string) or a structured ref. URL-ingest only: the URL is persisted and attached to the listing in order — the OTA push downloads it at publish time. Binary/multipart upload is a follow-up. A non-empty array with no valid http(s) URL is reported in &#x60;deferred&#x60; (existing photos left untouched). | [optional] |
| **photos_mode** | **String** | How &#x60;photos&#x60; is applied: &#x60;replace&#x60; (full replacement of the photo set) or &#x60;append&#x60; (add after the existing photos). Ignored when &#x60;photos&#x60; is absent. | [optional][default to &#39;replace&#39;] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequest.new(
  locale: it,
  title: null,
  name: null,
  description: null,
  summary: null,
  amenities: null,
  address: null,
  details: null,
  occupancy: null,
  rooms: null,
  checkout_tasks: null,
  pricing: null,
  policies: null,
  photos: null,
  photos_mode: null
)
```

