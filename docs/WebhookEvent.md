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
#   :'InquiryCreatedEvent',
#   :'InquiryUpdatedEvent',
#   :'ListingCreatedEvent',
#   :'ListingDeletedEvent',
#   :'ListingReactivatedEvent',
#   :'ListingSuspendedEvent',
#   :'ListingUpdatedEvent',
#   :'MigrationCompletedEvent',
#   :'MigrationFailedEvent',
#   :'PaymentCompletedEvent',
#   :'PaymentRefundedEvent',
#   :'RepullPingEvent',
#   :'ReservationAlterationCreatedEvent',
#   :'ReservationAlterationRespondedEvent',
#   :'ReservationCancelledEvent',
#   :'ReservationCreatedEvent',
#   :'ReservationMessageReceivedEvent',
#   :'ReservationRequestCreatedEvent',
#   :'ReservationRequestUpdatedEvent',
#   :'ReservationUpdatedEvent',
#   :'ReviewCreatedEvent',
#   :'ReviewRespondedEvent',
#   :'UsageQuotaWarningEvent'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'repull'

Repull::WebhookEvent.openapi_discriminator_name
# => :'event'
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
#   :'inquiry.created' => :'InquiryCreatedEvent',
#   :'inquiry.updated' => :'InquiryUpdatedEvent',
#   :'listing.created' => :'ListingCreatedEvent',
#   :'listing.deleted' => :'ListingDeletedEvent',
#   :'listing.reactivated' => :'ListingReactivatedEvent',
#   :'listing.suspended' => :'ListingSuspendedEvent',
#   :'listing.updated' => :'ListingUpdatedEvent',
#   :'migration.completed' => :'MigrationCompletedEvent',
#   :'migration.failed' => :'MigrationFailedEvent',
#   :'payment.completed' => :'PaymentCompletedEvent',
#   :'payment.refunded' => :'PaymentRefundedEvent',
#   :'repull.ping' => :'RepullPingEvent',
#   :'reservation.alteration.created' => :'ReservationAlterationCreatedEvent',
#   :'reservation.alteration.responded' => :'ReservationAlterationRespondedEvent',
#   :'reservation.cancelled' => :'ReservationCancelledEvent',
#   :'reservation.created' => :'ReservationCreatedEvent',
#   :'reservation.message.received' => :'ReservationMessageReceivedEvent',
#   :'reservation.request.created' => :'ReservationRequestCreatedEvent',
#   :'reservation.request.updated' => :'ReservationRequestUpdatedEvent',
#   :'reservation.updated' => :'ReservationUpdatedEvent',
#   :'review.created' => :'ReviewCreatedEvent',
#   :'review.responded' => :'ReviewRespondedEvent',
#   :'usage.quota.warning' => :'UsageQuotaWarningEvent'
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
- `InquiryCreatedEvent`
- `InquiryUpdatedEvent`
- `ListingCreatedEvent`
- `ListingDeletedEvent`
- `ListingReactivatedEvent`
- `ListingSuspendedEvent`
- `ListingUpdatedEvent`
- `MigrationCompletedEvent`
- `MigrationFailedEvent`
- `PaymentCompletedEvent`
- `PaymentRefundedEvent`
- `RepullPingEvent`
- `ReservationAlterationCreatedEvent`
- `ReservationAlterationRespondedEvent`
- `ReservationCancelledEvent`
- `ReservationCreatedEvent`
- `ReservationMessageReceivedEvent`
- `ReservationRequestCreatedEvent`
- `ReservationRequestUpdatedEvent`
- `ReservationUpdatedEvent`
- `ReviewCreatedEvent`
- `ReviewRespondedEvent`
- `UsageQuotaWarningEvent`
- `nil` (if no type matches)

