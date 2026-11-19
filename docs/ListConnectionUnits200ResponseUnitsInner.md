# Repull::ListConnectionUnits200ResponseUnitsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unit_id** | **String** |  | [optional] |
| **unit_name** | **String** |  | [optional] |
| **grain** | **String** |  | [optional] |
| **current_listing_id** | **Integer** |  | [optional] |
| **suggested_listing_id** | **Integer** |  | [optional] |
| **meta** | **Object** | Channel details that identify the unit. Booking.com Extranet: &#x60;hotel&#x60; (property name), &#x60;hotelId&#x60; (Booking.com property ID), &#x60;roomId&#x60; (Booking.com room ID), &#x60;city&#x60;. Vrbo: &#x60;headline&#x60;, &#x60;address&#x60;, &#x60;vrboStatus&#x60;, &#x60;calendarSync&#x60; (whether the unit&#39;s prices and availability are pushed to Vrbo) and, while Vrbo says another tool manages the account&#39;s calendar, &#x60;calendarSyncBlocked: \&quot;calendar_managed_elsewhere\&quot;&#x60;, and for a mapped unit &#x60;icalBackup&#x60;: &#x60;{ feedUrl, status, otherFeeds }&#x60; — the listing&#39;s Repull iCal backup feed and whether Vrbo imports it (&#x60;status&#x60; as on &#x60;GET /v1/listings/{id}/ical&#x60;: &#x60;imported&#x60;, &#x60;pending&#x60;, &#x60;failed&#x60;, &#x60;not_imported&#x60;, &#x60;off&#x60;; Repull adds it itself, so only on &#x60;failed&#x60; does the host add &#x60;feedUrl&#x60; in Vrbo → Calendar → Import calendar, named \&quot;Repull\&quot;); the Vrbo listing ID is &#x60;unit_id&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListConnectionUnits200ResponseUnitsInner.new(
  unit_id: null,
  unit_name: null,
  grain: null,
  current_listing_id: null,
  suggested_listing_id: null,
  meta: null
)
```

