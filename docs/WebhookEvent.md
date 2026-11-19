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
#   :'AccountCalendarAccessChangedEvent',
#   :'AccountCreatedEvent',
#   :'AccountDisconnectedEvent',
#   :'AccountImportCompletedEvent',
#   :'AccountImportFailedEvent',
#   :'AccountImportStartedEvent',
#   :'AccountNotificationsMissingEvent',
#   :'AccountUnitsAddedEvent',
#   :'AiOperationCompletedEvent',
#   :'AiOperationFailedEvent',
#   :'BookingUnacknowledgedEvent',
#   :'ChannelDegradedEvent',
#   :'ChannelSyncFailedEvent',
#   :'ConnectSessionAbandonedEvent',
#   :'ConnectSessionCompletedEvent',
#   :'ConversationMessageStatusChangedEvent',
#   :'InquiryCreatedEvent',
#   :'InquiryUpdatedEvent',
#   :'ListingCreatedEvent',
#   :'ListingDeletedEvent',
#   :'ListingIcalFeedChangedEvent',
#   :'ListingReactivatedEvent',
#   :'ListingSuspendedEvent',
#   :'ListingUpdatedEvent',
#   :'MigrationCompletedEvent',
#   :'MigrationFailedEvent',
#   :'PaymentCompletedEvent',
#   :'PaymentRefundedEvent',
#   :'PayoutCompletedEvent',
#   :'RepullPingEvent',
#   :'ReservationAlterationCreatedEvent',
#   :'ReservationAlterationRespondedEvent',
#   :'ReservationCancelledEvent',
#   :'ReservationCreatedEvent',
#   :'ReservationMessageReactionEvent',
#   :'ReservationMessageReadEvent',
#   :'ReservationMessageReceivedEvent',
#   :'ReservationMessageSentEvent',
#   :'ReservationMessageUpdatedEvent',
#   :'ReservationRequestCreatedEvent',
#   :'ReservationRequestUpdatedEvent',
#   :'ReservationThreadAssignedEvent',
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
#   :'account.calendar_access_changed' => :'AccountCalendarAccessChangedEvent',
#   :'account.created' => :'AccountCreatedEvent',
#   :'account.disconnected' => :'AccountDisconnectedEvent',
#   :'account.import.completed' => :'AccountImportCompletedEvent',
#   :'account.import.failed' => :'AccountImportFailedEvent',
#   :'account.import.started' => :'AccountImportStartedEvent',
#   :'account.notifications_missing' => :'AccountNotificationsMissingEvent',
#   :'account.units.added' => :'AccountUnitsAddedEvent',
#   :'ai.operation.completed' => :'AiOperationCompletedEvent',
#   :'ai.operation.failed' => :'AiOperationFailedEvent',
#   :'booking.unacknowledged' => :'BookingUnacknowledgedEvent',
#   :'channel.degraded' => :'ChannelDegradedEvent',
#   :'channel.sync.failed' => :'ChannelSyncFailedEvent',
#   :'connect.session.abandoned' => :'ConnectSessionAbandonedEvent',
#   :'connect.session.completed' => :'ConnectSessionCompletedEvent',
#   :'conversation.message.status_changed' => :'ConversationMessageStatusChangedEvent',
#   :'inquiry.created' => :'InquiryCreatedEvent',
#   :'inquiry.updated' => :'InquiryUpdatedEvent',
#   :'listing.created' => :'ListingCreatedEvent',
#   :'listing.deleted' => :'ListingDeletedEvent',
#   :'listing.ical_feed_changed' => :'ListingIcalFeedChangedEvent',
#   :'listing.reactivated' => :'ListingReactivatedEvent',
#   :'listing.suspended' => :'ListingSuspendedEvent',
#   :'listing.updated' => :'ListingUpdatedEvent',
#   :'migration.completed' => :'MigrationCompletedEvent',
#   :'migration.failed' => :'MigrationFailedEvent',
#   :'payment.completed' => :'PaymentCompletedEvent',
#   :'payment.refunded' => :'PaymentRefundedEvent',
#   :'payout.completed' => :'PayoutCompletedEvent',
#   :'repull.ping' => :'RepullPingEvent',
#   :'reservation.alteration.created' => :'ReservationAlterationCreatedEvent',
#   :'reservation.alteration.responded' => :'ReservationAlterationRespondedEvent',
#   :'reservation.cancelled' => :'ReservationCancelledEvent',
#   :'reservation.created' => :'ReservationCreatedEvent',
#   :'reservation.message.reaction' => :'ReservationMessageReactionEvent',
#   :'reservation.message.read' => :'ReservationMessageReadEvent',
#   :'reservation.message.received' => :'ReservationMessageReceivedEvent',
#   :'reservation.message.sent' => :'ReservationMessageSentEvent',
#   :'reservation.message.updated' => :'ReservationMessageUpdatedEvent',
#   :'reservation.request.created' => :'ReservationRequestCreatedEvent',
#   :'reservation.request.updated' => :'ReservationRequestUpdatedEvent',
#   :'reservation.thread.assigned' => :'ReservationThreadAssignedEvent',
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
# => #<AccountCalendarAccessChangedEvent:0x00007fdd4aab02a0>

Repull::WebhookEvent.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `AccountCalendarAccessChangedEvent`
- `AccountCreatedEvent`
- `AccountDisconnectedEvent`
- `AccountImportCompletedEvent`
- `AccountImportFailedEvent`
- `AccountImportStartedEvent`
- `AccountNotificationsMissingEvent`
- `AccountUnitsAddedEvent`
- `AiOperationCompletedEvent`
- `AiOperationFailedEvent`
- `BookingUnacknowledgedEvent`
- `ChannelDegradedEvent`
- `ChannelSyncFailedEvent`
- `ConnectSessionAbandonedEvent`
- `ConnectSessionCompletedEvent`
- `ConversationMessageStatusChangedEvent`
- `InquiryCreatedEvent`
- `InquiryUpdatedEvent`
- `ListingCreatedEvent`
- `ListingDeletedEvent`
- `ListingIcalFeedChangedEvent`
- `ListingReactivatedEvent`
- `ListingSuspendedEvent`
- `ListingUpdatedEvent`
- `MigrationCompletedEvent`
- `MigrationFailedEvent`
- `PaymentCompletedEvent`
- `PaymentRefundedEvent`
- `PayoutCompletedEvent`
- `RepullPingEvent`
- `ReservationAlterationCreatedEvent`
- `ReservationAlterationRespondedEvent`
- `ReservationCancelledEvent`
- `ReservationCreatedEvent`
- `ReservationMessageReactionEvent`
- `ReservationMessageReadEvent`
- `ReservationMessageReceivedEvent`
- `ReservationMessageSentEvent`
- `ReservationMessageUpdatedEvent`
- `ReservationRequestCreatedEvent`
- `ReservationRequestUpdatedEvent`
- `ReservationThreadAssignedEvent`
- `ReservationUpdatedEvent`
- `ReviewCreatedEvent`
- `ReviewRespondedEvent`
- `UsageQuotaWarningEvent`
- `nil` (if no type matches)

