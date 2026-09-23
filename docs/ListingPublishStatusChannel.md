# Repull::ListingPublishStatusChannel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **platform** | **String** |  |  |
| **push_status** | **String** |  | [optional] |
| **push_error** | **String** | Why the last push failed — the channel&#39;s own reason, verbatim, sanitised for display.  This is the field to render when &#x60;pushStatus&#x60; is &#x60;error&#x60;. It carries what Airbnb or Booking.com actually objected to, which is almost always something the operator can fix in the listing content: &#x60;\&quot;Airbnb error (400): We can&#39;t save your info yet. Links and contact info can&#39;t be shared.\&quot;&#x60;, &#x60;\&quot;Check-in start time must be before end time\&quot;&#x60;, &#x60;\&quot;property_type_group must be one of [apartments, houses, …]\&quot;&#x60;, &#x60;\&quot;Rate limited by provider\&quot;&#x60;.  **Free text, not an enum.** It is written by the channel and changes without notice: show it to a human, log it, put it next to the retry button — but never parse it or branch on its contents. When a push fails for several reasons at once the reasons are joined with &#x60;; &#x60;.  &#x60;null&#x60; when the last push succeeded, and when no push has run yet — the two are told apart by &#x60;pushStatus&#x60; and &#x60;lastPushedAt&#x60;, not by this field. |  |
| **last_pushed_at** | **Time** |  | [optional] |
| **last_pulled_at** | **Time** |  | [optional] |
| **dirty_fields** | **Array&lt;String&gt;** |  | [optional] |
| **platform_has_changes** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPublishStatusChannel.new(
  platform: airbnb,
  push_status: null,
  push_error: Airbnb error (400): property_type_group must be one of [apartments, houses, secondary_units, unique_homes, bnb],
  last_pushed_at: null,
  last_pulled_at: null,
  dirty_fields: null,
  platform_has_changes: null
)
```

