# Repull::ListingContentUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **title** | **String** | Guest-facing title. Written to the listing name and the &#x60;en&#x60; description. | [optional] |
| **name** | **String** | Alias for &#x60;title&#x60;. | [optional] |
| **description** | **String** | Long-form listing description. | [optional] |
| **summary** | **String** | Short summary / tagline. | [optional] |
| **amenities** | [**ListingContentUpdateRequestAmenities**](ListingContentUpdateRequestAmenities.md) |  | [optional] |
| **address** | [**ListingContentUpdateRequestAddress**](ListingContentUpdateRequestAddress.md) |  | [optional] |
| **occupancy** | [**ListingContentUpdateRequestOccupancy**](ListingContentUpdateRequestOccupancy.md) |  | [optional] |
| **policies** | [**ListingContentUpdateRequestPolicies**](ListingContentUpdateRequestPolicies.md) |  | [optional] |
| **photos** | [**Array&lt;ListingContentUpdateRequestPhotosInner&gt;**](ListingContentUpdateRequestPhotosInner.md) | Photo set — full replacement by default (pass &#x60;photosMode: \&quot;append\&quot;&#x60; to add after existing photos, or &#x60;[]&#x60; to clear; omit to leave untouched). Each entry is a hosted image URL (string) or a structured ref. URL-ingest only: the URL is persisted and attached to the listing in order — the OTA push downloads it at publish time. Binary/multipart upload is a follow-up. A non-empty array with no valid http(s) URL is reported in &#x60;deferred&#x60; (existing photos left untouched). | [optional] |
| **photos_mode** | **String** | How &#x60;photos&#x60; is applied: &#x60;replace&#x60; (full replacement of the photo set) or &#x60;append&#x60; (add after the existing photos). Ignored when &#x60;photos&#x60; is absent. | [optional][default to &#39;replace&#39;] |

## Example

```ruby
require 'repull'

instance = Repull::ListingContentUpdateRequest.new(
  title: null,
  name: null,
  description: null,
  summary: null,
  amenities: null,
  address: null,
  occupancy: null,
  policies: null,
  photos: null,
  photos_mode: null
)
```

