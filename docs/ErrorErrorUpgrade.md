# Repull::ErrorErrorUpgrade

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **plan** | **String** |  |  |
| **name** | **String** |  |  |
| **monthly_price_usd** | **Float** | Monthly price in USD for &#x60;listings&#x60;: Starter&#39;s base plus its per-listing price. Null for &#x60;custom&#x60;. |  |
| **listings** | **Integer** | Listings the price covers: your active ones, across your workspaces (what checkout bills). Held-back listings are not included; upgrading does not switch them on. |  |
| **monthly_requests** | **Integer** | Requests a month the plan includes. Null for &#x60;custom&#x60;. |  |
| **daily_requests** | **Integer** | The plan&#39;s daily request cap. Null for &#x60;custom&#x60;. |  |
| **checkout_url** | **String** | Opens checkout for exactly &#x60;monthly_price_usd&#x60;. Null for &#x60;custom&#x60;. |  |
| **contact_email** | **String** | Where to ask for a plan when &#x60;plan&#x60; is &#x60;custom&#x60;. |  |

## Example

```ruby
require 'repull'

instance = Repull::ErrorErrorUpgrade.new(
  plan: starter,
  name: Starter,
  monthly_price_usd: 99,
  listings: 2,
  monthly_requests: 100000,
  daily_requests: 25000,
  checkout_url: https://repull.dev/dashboard/billing?upgrade&#x3D;starter,
  contact_email: null
)
```

