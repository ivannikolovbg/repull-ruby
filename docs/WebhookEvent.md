# Repull::WebhookEvent

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'repull'

Repull::WebhookEvent.openapi_one_of
# =>
# [
#   :'AccountCreatedEvent',
#   :'AccountDisconnectedEvent',
#   :'AiOperationCompletedEvent',
#   :'AiOperationFailedEvent',
#   :'CalendarUpdatedEvent',
#   :'ListingCreatedEvent',
#   :'ListingDeletedEvent',
#   :'ListingUpdatedEvent',
#   :'PaymentCompletedEvent',
#   :'PaymentRefundedEvent',
#   :'RepullPingEvent',
#   :'ReservationCancelledEvent',
#   :'ReservationCreatedEvent',
#   :'ReservationMessageReceivedEvent',
#   :'ReservationUpdatedEvent'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'repull'

Repull::WebhookEvent.openapi_discriminator_name
# => :'type'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'repull'

Repull::WebhookEvent.openapi_discriminator_mapping
# =>
# {
#   :'account.created' => :'AccountCreatedEvent',
#   :'account.disconnected' => :'AccountDisconnectedEvent',
#   :'ai.operation.completed' => :'AiOperationCompletedEvent',
#   :'ai.operation.failed' => :'AiOperationFailedEvent',
#   :'calendar.updated' => :'CalendarUpdatedEvent',
#   :'listing.created' => :'ListingCreatedEvent',
#   :'listing.deleted' => :'ListingDeletedEvent',
#   :'listing.updated' => :'ListingUpdatedEvent',
#   :'payment.completed' => :'PaymentCompletedEvent',
#   :'payment.refunded' => :'PaymentRefundedEvent',
#   :'repull.ping' => :'RepullPingEvent',
#   :'reservation.cancelled' => :'ReservationCancelledEvent',
#   :'reservation.created' => :'ReservationCreatedEvent',
#   :'reservation.message.received' => :'ReservationMessageReceivedEvent',
#   :'reservation.updated' => :'ReservationUpdatedEvent'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'repull'

Repull::WebhookEvent.build(data)
# => #<AccountCreatedEvent:0x00007fdd4aab02a0>

Repull::WebhookEvent.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `AccountCreatedEvent`
- `AccountDisconnectedEvent`
- `AiOperationCompletedEvent`
- `AiOperationFailedEvent`
- `CalendarUpdatedEvent`
- `ListingCreatedEvent`
- `ListingDeletedEvent`
- `ListingUpdatedEvent`
- `PaymentCompletedEvent`
- `PaymentRefundedEvent`
- `RepullPingEvent`
- `ReservationCancelledEvent`
- `ReservationCreatedEvent`
- `ReservationMessageReceivedEvent`
- `ReservationUpdatedEvent`
- `nil` (if no type matches)

