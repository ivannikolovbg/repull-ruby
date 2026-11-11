# Repull::GetVrboPublishJob200ResponseJob

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **job_id** | **String** | Pass to &#x60;GET /v1/listings/{id}/publish/vrbo?jobId&#x3D;&#x60;. | [optional] |
| **status** | **String** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **account_id** | **Integer** | The Vrbo account (connection &#x60;vrbo:&lt;accountId&gt;&#x60;) the listing is created in. | [optional] |
| **steps** | **Array&lt;String&gt;** | Steps Vrbo has finished, in order: create, amenities, property type, rooms, photos, headline + description, house rules, rate, booking options, publish, fees, cancellation policy, … | [optional] |
| **error** | **String** | Vrbo&#39;s reason when &#x60;status&#x60; is &#x60;failed&#x60;. | [optional] |
| **vrbo_listing_number** | **String** | The new Vrbo listing number, once Vrbo has published it. | [optional] |
| **property_id** | **String** | The Vrbo property being built. Send it back as &#x60;propertyId&#x60; to finish a run that failed part-way. | [optional] |
| **linked** | **Boolean** | The new Vrbo unit is linked to the listing with calendar sync on, and the whole calendar has been queued to Vrbo. | [optional] |
| **rejected_photos** | [**Array&lt;GetVrboPublishJob200ResponseJobRejectedPhotosInner&gt;**](GetVrboPublishJob200ResponseJobRejectedPhotosInner.md) | Photos Vrbo&#39;s review refused (position in the listing&#39;s order, and Vrbo&#39;s reason). | [optional] |
| **adjustments** | **Array&lt;String&gt;** | POST only: where the Vrbo listing departs from the listing&#39;s content because of a Vrbo rule. | [optional] |
| **resumed_property_id** | **String** | POST only: set when an unfinished Vrbo property of this listing is completed instead of starting a new one. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboPublishJob200ResponseJob.new(
  job_id: null,
  status: null,
  listing_id: null,
  account_id: null,
  steps: null,
  error: null,
  vrbo_listing_number: null,
  property_id: null,
  linked: null,
  rejected_photos: null,
  adjustments: null,
  resumed_property_id: null
)
```

