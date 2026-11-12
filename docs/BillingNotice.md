# Repull::BillingNotice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | \&quot;payment_failed\&quot;: the last renewal payment failed and is still owed. |  |
| **amount** | **Float** | The amount owed, in major units of &#x60;currency&#x60;. |  |
| **currency** | **String** | Lower-case ISO 4217 code. |  |
| **failed_at** | **Time** | When the payment failed. |  |
| **next_retry_at** | **Time** | When Stripe retries the card automatically; null when no retry is left. |  |
| **pay_url** | **String** | Stripe&#39;s hosted invoice: pay it there with any card. |  |
| **message** | **String** |  |  |
| **fix** | **String** |  |  |
| **billing_url** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::BillingNotice.new(
  code: null,
  amount: 99,
  currency: usd,
  failed_at: 2026-11-12T14:52:17Z,
  next_retry_at: 2026-11-14T20:52:16Z,
  pay_url: https://invoice.stripe.com/i/acct_1TUV6uDYjA8GNo6e/live_abc,
  message: Your $99.00 Repull plan payment failed on Nov 12, 2026. Your API calls keep working. Stripe retries the card automatically on Nov 14, 2026.,
  fix: Pay the invoice at &#x60;payUrl&#x60;, or update the card at https://repull.dev/dashboard/billing (Manage billing) so the next retry goes through. This notice disappears once it is paid.,
  billing_url: https://repull.dev/dashboard/billing
)
```

