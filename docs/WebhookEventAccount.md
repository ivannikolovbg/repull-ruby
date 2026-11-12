# Repull::WebhookEventAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Our connection record id: the &#x60;X-Account-Id&#x60; value, the same as &#x60;account.id&#x60;. &#x60;null&#x60; only when the account has no connection record (e.g. a Vrbo sign-in in a workspace with no Vrbo connection). | [optional] |
| **provider** | **String** |  | [optional] |
| **external_account_id** | **String** | The platform&#39;s own account id: Airbnb host id; Booking.com hotel id (&#x60;booking&#x60;); the Booking.com account id behind the Extranet login (&#x60;booking_extranet&#x60;); Vrbo&#39;s account id (&#x60;vrbo&#x60;); the PMS&#39;s own account or company id. &#x60;null&#x60; when the platform id is not known yet (a Vrbo sign-in before its account id is captured, a PMS that does not expose one); never a Repull id. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::WebhookEventAccount.new(
  id: 135,
  provider: airbnb,
  external_account_id: 79730216
)
```

