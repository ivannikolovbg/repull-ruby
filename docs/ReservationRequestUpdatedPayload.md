# Repull::ReservationRequestUpdatedPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **object** | [**ReservationWebhookObject**](ReservationWebhookObject.md) |  |  |
| **request_status** | **String** | &#x60;accepted&#x60; — it is a booking now; &#x60;declined&#x60; — by the host; &#x60;expired&#x60; — nobody answered in time; &#x60;voided&#x60; — withdrawn by the guest, or voided by the channel (for example the guest failed verification). |  |
| **previous_attributes** | **Hash&lt;String, Object&gt;** | Fields of &#x60;object&#x60; that moved, with their prior values — always &#x60;{ \&quot;status\&quot;: \&quot;pending\&quot; }&#x60; here. |  |
| **source_status** | **String** | The channel&#39;s own status value, unmapped (Airbnb: &#x60;accept&#x60;, &#x60;deny&#x60;, &#x60;timeout&#x60;, &#x60;pending_voided&#x60;, …) — for reconciling against the channel. | [optional] |
| **occurred_at** | **Time** |  | [optional] |
| **revision** | **Time** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ReservationRequestUpdatedPayload.new(
  object: null,
  request_status: accepted,
  previous_attributes: {&quot;status&quot;:&quot;pending&quot;},
  source_status: accept,
  occurred_at: 2026-09-22T11:42:10Z,
  revision: null
)
```

