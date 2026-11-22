# Repull::GetVrboListing200ResponseDataInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Repull&#39;s id for this link. | [optional] |
| **listing_id** | **String** |  | [optional] |
| **vrbo_listing_number** | **String** | The number in the Vrbo URL (vrbo.com/4512345). | [optional] |
| **unit_id** | **String** |  | [optional] |
| **property_id** | **String** | Vrbo&#39;s property id. | [optional] |
| **advertiser_id** | **String** |  | [optional] |
| **url** | **String** |  | [optional] |
| **status** | **String** | Vrbo&#39;s own status: &#x60;LIVE&#x60;, &#x60;InactiveByOwnerRequest&#x60; (hidden), … | [optional] |
| **live** | **Boolean** |  | [optional] |
| **connected** | **Boolean** | Linked through a connected Vrbo account — the link content, calendar and messages go through. | [optional] |
| **active** | **Boolean** |  | [optional] |
| **sync_enabled** | **Boolean** |  | [optional] |
| **account_id** | **String** | The Vrbo account the unit is on, as &#x60;GET /v1/connect/vrbo-login&#x60; lists it. | [optional] |
| **account_name** | **String** |  | [optional] |
| **access_type** | **String** |  | [optional] |
| **account_status** | **String** |  | [optional] |
| **headline** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **thumbnail_url** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **markup_percent** | **Float** | The markup Repull adds to this unit&#39;s prices. | [optional] |
| **booking_policy** | **String** |  | [optional] |
| **capacity** | [**GetVrboListing200ResponseDataInnerCapacity**](GetVrboListing200ResponseDataInnerCapacity.md) |  | [optional] |
| **bedrooms** | **Integer** |  | [optional] |
| **bathrooms** | **Float** |  | [optional] |
| **beds** | **Integer** |  | [optional] |
| **check_in_time** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **min_stay** | **Integer** |  | [optional] |
| **max_stay** | **Integer** |  | [optional] |
| **min_advance_notice_days** | **Integer** |  | [optional] |
| **address** | [**GetVrboListing200ResponseDataInnerAddress**](GetVrboListing200ResponseDataInnerAddress.md) |  | [optional] |
| **rating** | [**GetVrboListing200ResponseDataInnerRating**](GetVrboListing200ResponseDataInnerRating.md) |  | [optional] |
| **host_name** | **String** |  | [optional] |
| **linked_at** | **String** |  | [optional] |
| **disconnected_at** | **String** |  | [optional] |
| **details_synced_at** | **String** |  | [optional] |
| **content** | [**GetVrboListing200ResponseDataInnerContent**](GetVrboListing200ResponseDataInnerContent.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListing200ResponseDataInner.new(
  id: null,
  listing_id: null,
  vrbo_listing_number: 4512345,
  unit_id: null,
  property_id: null,
  advertiser_id: null,
  url: null,
  status: LIVE,
  live: null,
  connected: null,
  active: null,
  sync_enabled: null,
  account_id: vrbo:7001234,
  account_name: null,
  access_type: null,
  account_status: null,
  headline: null,
  name: null,
  thumbnail_url: null,
  currency: null,
  markup_percent: null,
  booking_policy: null,
  capacity: null,
  bedrooms: null,
  bathrooms: null,
  beds: null,
  check_in_time: null,
  check_out_time: null,
  min_stay: null,
  max_stay: null,
  min_advance_notice_days: null,
  address: null,
  rating: null,
  host_name: null,
  linked_at: null,
  disconnected_at: null,
  details_synced_at: null,
  content: null
)
```

