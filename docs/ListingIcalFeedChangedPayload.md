# Repull::ListingIcalFeedChangedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ListingWebhookObject**](ListingWebhookObject.md) |  |  |
| **provider** | **String** |  |  |
| **action** | **String** | &#x60;repull_feed_added&#x60;: the Repull feed is now imported (&#x60;reason: \&quot;repull_feed_missing\&quot;&#x60; when it had been removed on Vrbo and was put back). &#x60;repull_feed_add_failed&#x60;: Vrbo did not take it — ask the host to add &#x60;repullFeedUrl&#x60; in Vrbo → Calendar → Import calendar, named \&quot;Repull\&quot;; nothing else is changed on the unit until it is there. &#x60;other_feed_removed&#x60;: another tool&#39;s imported calendar (&#x60;feed&#x60;) was removed. &#x60;other_feed_remove_failed&#x60;: removing it failed — ask the host to remove it in Vrbo → Calendar → Import calendar. Repull also emails the workspace owner when an action failed. |  |
| **feed** | [**ListingIcalFeedChangedPayloadFeed**](ListingIcalFeedChangedPayloadFeed.md) |  |  |
| **repull_feed_url** | **String** | The listing&#39;s Repull iCal backup feed (&#x60;GET /v1/listings/{id}/ical&#x60;). |  |
| **reason** | **String** | Why Repull acted. | [optional] |
| **trigger** | **String** | &#x60;calendar_sync_enabled&#x60;: calendar sync was just switched on for the unit. &#x60;drift_check&#x60;: the daily Vrbo calendar check. |  |
| **error** | **String** | Vrbo&#39;s answer, on a failed action. | [optional] |
| **occurred_at** | **Time** |  |  |
| **docs_url** | **String** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingIcalFeedChangedPayload.new(
  object: null,
  provider: null,
  action: null,
  feed: null,
  repull_feed_url: null,
  reason: null,
  trigger: null,
  error: null,
  occurred_at: null,
  docs_url: https://repull.dev/docs/channels/vrbo/ical-backup
)
```

