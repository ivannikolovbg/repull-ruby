# Repull::GetListingIcal200ResponseVrboInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **unit_id** | **String** | The Vrbo listing number (&#x60;unitId&#x60; on &#x60;GET /v1/connections/{id}/units&#x60;). |  |
| **calendar_sync** | **Boolean** | Calendar sync is on for the unit. |  |
| **status** | **String** | &#x60;imported&#x60;: Vrbo imports the feed. &#x60;pending&#x60;: calendar sync is on and Repull has not checked the unit yet — it adds the feed itself. &#x60;failed&#x60;: Vrbo did not take it; ask the host to add &#x60;url&#x60; in Vrbo → Calendar → Import calendar, named \&quot;Repull\&quot;. &#x60;not_imported&#x60;: checked, not there, and not added (for example, the feed is turned off). &#x60;off&#x60;: calendar sync is off, so Repull leaves the unit&#39;s imported calendars alone. |  |
| **other_feeds** | **Array&lt;String&gt;** | Names of other calendars the unit still imports, as Vrbo shows them. |  |
| **checked_at** | **Time** | When Repull last read the unit&#39;s imported calendars. |  |

## Example

```ruby
require 'repull'

instance = Repull::GetListingIcal200ResponseVrboInner.new(
  unit_id: 7001234,
  calendar_sync: null,
  status: null,
  other_feeds: [],
  checked_at: null
)
```

