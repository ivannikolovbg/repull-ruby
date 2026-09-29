# Repull::GetListingCalendarSync200ResponseChannelsInnerQueueLastPush

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **finished_at** | **Time** |  | [optional] |
| **result** | **String** | &#x60;skipped&#x60; — not sent because the unit is not live on VRBO (&#x60;reason&#x60;). | [optional] |
| **reason** | **String** |  | [optional] |
| **nights** | **Integer** | Nights the push covered. | [optional] |
| **prices_changed** | **Integer** |  | [optional] |
| **min_stays_changed** | **Integer** |  | [optional] |
| **blocks_created** | **Integer** |  | [optional] |
| **blocks_removed** | **Integer** |  | [optional] |
| **calls** | **Integer** | VRBO calls made — only what differed was sent. | [optional] |
| **nights_differing** | **Integer** | Nights VRBO still showed differently after the push (they are retried). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingCalendarSync200ResponseChannelsInnerQueueLastPush.new(
  finished_at: null,
  result: null,
  reason: null,
  nights: null,
  prices_changed: null,
  min_stays_changed: null,
  blocks_created: null,
  blocks_removed: null,
  calls: null,
  nights_differing: null
)
```

