# Repull::PmsCapabilities

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **provider** | **String** |  | [optional] |
| **connected** | **Boolean** | &#x60;false&#x60;: what the connector supports once connected (on a listing: a dead link — every write answers &#x60;409 no_connection&#x60;). | [optional] |
| **reservations** | [**PmsCapabilitiesReservations**](PmsCapabilitiesReservations.md) |  | [optional] |
| **reviews** | [**PmsCapabilitiesReviews**](PmsCapabilitiesReviews.md) |  | [optional] |
| **listings** | [**PmsCapabilitiesListings**](PmsCapabilitiesListings.md) |  | [optional] |
| **guests** | [**PmsCapabilitiesGuests**](PmsCapabilitiesGuests.md) |  | [optional] |
| **conversations** | [**PmsCapabilitiesConversations**](PmsCapabilitiesConversations.md) |  | [optional] |
| **calendar** | [**PmsCapabilitiesCalendar**](PmsCapabilitiesCalendar.md) |  | [optional] |
| **payments** | [**PmsCapabilitiesPayments**](PmsCapabilitiesPayments.md) |  | [optional] |
| **tasks** | [**PmsCapabilitiesTasks**](PmsCapabilitiesTasks.md) |  | [optional] |
| **notes** | **Hash&lt;String, String&gt;** | The connector&#39;s own notes per family (limits, required access). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PmsCapabilities.new(
  provider: guesty,
  connected: null,
  reservations: null,
  reviews: null,
  listings: null,
  guests: null,
  conversations: null,
  calendar: null,
  payments: null,
  tasks: null,
  notes: null
)
```

