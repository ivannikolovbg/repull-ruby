# Repull::ApplyConnectionMappings200ResponseResultsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unit_id** | **String** |  | [optional] |
| **listing_id** | **Integer** |  | [optional] |
| **created** | **Boolean** |  | [optional] |
| **ok** | **Boolean** |  | [optional] |
| **error** | **String** |  | [optional] |
| **ical_feed_url** | **String** | Vrbo, for a mapped unit: the listing&#39;s Repull iCal backup feed (&#x60;GET /v1/listings/{id}/ical&#x60;). With calendar sync on, Repull imports it into the Vrbo unit by itself (Vrbo → Calendar → Import calendar, named \&quot;Repull\&quot;) and removes other tools&#39; imported feeds; &#x60;listing.ical_feed_changed&#x60; reports it. Only if that fails does the host add it by hand. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ApplyConnectionMappings200ResponseResultsInner.new(
  unit_id: null,
  listing_id: null,
  created: null,
  ok: null,
  error: null,
  ical_feed_url: https://api.repull.dev/ical/4f9c2d7e1a8b3c6d5e0f9a2b7c4d1e8f3a6b9c2d5e8f1a4b7c0d3e6f9a2b5c8d.ics
)
```

