# Repull::Listing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **capabilities** | [**ListingCapabilities**](ListingCapabilities.md) |  | [optional] |
| **kind** | **String** | &#x60;room_type&#x60; when the listing sells several identical units (a hotel room type: &#x60;unitCount&#x60; &gt; 1) or is a hotel PMS room type; &#x60;home&#x60; otherwise. See the Hotels &amp; multi-unit guide. | [optional] |
| **hotel** | [**ListingHotel**](ListingHotel.md) |  | [optional] |
| **unit_count** | **Integer** | How many identical units (rooms) this listing sells: the hotel PMS rooms of the room type, the room count on Booking.com, or 1 for a home. Rooms left per night are &#x60;availableUnits&#x60; on &#x60;GET /v1/availability/{propertyId}&#x60;. | [optional] |
| **units** | [**Array&lt;ListingUnitsInner&gt;**](ListingUnitsInner.md) | &#x60;GET /v1/listings/{id}&#x60; only. The physical rooms under a hotel-model listing (a Mews or Cloudbeds room type); empty for a single home. Same items as &#x60;GET /v1/listings/{id}/units&#x60;. | [optional] |
| **id** | **String** | Repull listing id | [optional] |
| **name** | **String** | The host&#39;s internal nickname for the listing. | [optional] |
| **public_name** | **String** | The title guests see on the channel (e.g. the Airbnb listing title). &#x60;name&#x60; is the host&#39;s internal nickname for the listing; show &#x60;publicName&#x60; in anything a guest or end user reads. Present on inactive rows too. | [optional] |
| **address** | [**ListingAddress**](ListingAddress.md) |  | [optional] |
| **thumbnail_url** | **String** | Cover photo URL. Always present on an active listing. On an **inactive** one it is present only when the caller passes &#x60;?include&#x3D;thumbnail&#x60;; &#x60;null&#x60; means the listing has no cover photo stored, absent means the expansion was not requested. | [optional] |
| **status** | **String** |  | [optional] |
| **channels** | [**Array&lt;ListingChannel&gt;**](ListingChannel.md) | Channels (Airbnb, Booking, VRBO, etc.) the listing is connected to. | [optional] |
| **amenities** | [**Array&lt;ListingAmenity&gt;**](ListingAmenity.md) | Amenity rows for the listing. **Only present when the caller passes &#x60;?include&#x3D;amenities&#x60;.** Empty array (&#x60;[]&#x60;) when the listing has no amenity rows. | [optional] |
| **content** | [**ListingContent**](ListingContent.md) | **Only present when the caller passes &#x60;?include&#x3D;content&#x60;.** Sourced from &#x60;listings_descriptions&#x60; for the &#x60;en&#x60; locale. &#x60;null&#x60; when the listing has no description row stored (vs the field being absent — that signals the caller did not opt into the expansion). | [optional] |
| **details** | [**ListingDetails**](ListingDetails.md) | **Only present when the caller passes &#x60;?include&#x3D;details&#x60;.** Sourced from &#x60;listings_details&#x60;. &#x60;null&#x60; when the listing has no details row stored (vs the field being absent — that signals the caller did not opt into the expansion). | [optional] |
| **rooms** | [**Array&lt;ListingRoom&gt;**](ListingRoom.md) | **Only present with &#x60;?include&#x3D;rooms&#x60;.** Each room and its beds. &#x60;[]&#x60; when none are stored. | [optional] |
| **policies** | [**ListingPolicies**](ListingPolicies.md) | **Only present with &#x60;?include&#x3D;policies&#x60;.** Cancellation, house rules, check-in and check-out, pets/smoking/events/children, quiet hours, deposit. | [optional] |
| **rules** | [**ListingRules**](ListingRules.md) | **Only present with &#x60;?include&#x3D;rules&#x60;.** Stay rules: min/max nights, booking window, advance notice, preparation time, and whether booking requests are allowed. | [optional] |
| **pricing** | [**ListingPricingSettings**](ListingPricingSettings.md) | **Only present with &#x60;?include&#x3D;pricing&#x60;.** Standing prices: base and weekend rate, cleaning and extra-guest fees, deposit, weekly/monthly discounts. &#x60;null&#x60; when none are stored. | [optional] |
| **fees** | [**Array&lt;ListingFee&gt;**](ListingFee.md) | **Only present with &#x60;?include&#x3D;fees&#x60;.** Every fee, the cleaning fee included, whatever channel or PMS it came from. &#x60;[]&#x60; when none. | [optional] |
| **taxes** | [**Array&lt;ListingTax&gt;**](ListingTax.md) | **Only present with &#x60;?include&#x3D;taxes&#x60;.** Taxes charged to the guest. &#x60;[]&#x60; when none. | [optional] |
| **photos** | [**Array&lt;ListingContentPhoto&gt;**](ListingContentPhoto.md) | **Only present with &#x60;?include&#x3D;photos&#x60;.** The listing photos in display order. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::Listing.new(
  capabilities: null,
  kind: null,
  hotel: null,
  unit_count: null,
  units: null,
  id: null,
  name: I - Stafford Apartment,
  public_name: Centre Oxford bright single room D,
  address: null,
  thumbnail_url: null,
  status: null,
  channels: null,
  amenities: null,
  content: null,
  details: null,
  rooms: null,
  policies: null,
  rules: null,
  pricing: null,
  fees: null,
  taxes: null,
  photos: null,
  created_at: null,
  updated_at: null
)
```

