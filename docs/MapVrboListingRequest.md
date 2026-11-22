# Repull::MapVrboListingRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vrbo_listing_number** | **String** | The number in the Vrbo URL (vrbo.com/4512345). |  |
| **listing_id** | **Integer** | The Repull listing to link it to. Or &#x60;create: true&#x60;. | [optional] |
| **create** | **Boolean** | Create a Repull listing from what Vrbo shows, instead of &#x60;listingId&#x60;. | [optional] |
| **account_id** | **String** | The Vrbo account the unit is on, when the workspace has several. | [optional] |
| **sync_enabled** | **Boolean** | Also send the listing&#39;s calendar to Vrbo. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::MapVrboListingRequest.new(
  vrbo_listing_number: 4512345,
  listing_id: 98765,
  create: null,
  account_id: vrbo:7001234,
  sync_enabled: null
)
```

