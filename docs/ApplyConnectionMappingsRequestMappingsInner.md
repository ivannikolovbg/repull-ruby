# Repull::ApplyConnectionMappingsRequestMappingsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unit_id** | **String** |  |  |
| **listing_id** | **Integer** |  | [optional] |
| **create** | **Boolean** |  | [optional] |
| **calendar_sync** | **Boolean** | Vrbo: push this listing&#39;s prices and availability to Vrbo. Omit to follow the connection&#39;s access type (&#x60;messaging&#x60; &#x3D; off, &#x60;full_access&#x60; &#x3D; on). A new listing (&#x60;create&#x60;) always follows the access type. Other channels ignore it. &#x60;true&#x60; returns &#x60;409 calendar_managed_elsewhere&#x60; while Vrbo says another tool (such as a PMS) manages the account&#39;s calendar (&#x60;calendar.managedBy&#x60; on &#x60;GET /v1/connect/vrbo-login&#x60;); see https://repull.dev/docs/channels/vrbo/calendar-managed-elsewhere. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ApplyConnectionMappingsRequestMappingsInner.new(
  unit_id: null,
  listing_id: null,
  create: null,
  calendar_sync: null
)
```

