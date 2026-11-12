# Repull::PlanNotice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | \&quot;listings_held_back\&quot;: some connected listings are held inactive by the plan. \&quot;listings_over_plan\&quot;: more listings are active than the plan includes (after a downgrade). Neither blocks any call. |  |
| **active_listing_count** | **Integer** | Active listings right now. Only when the code is \&quot;listings_over_plan\&quot;. | [optional] |
| **listings_held_back** | **Integer** | Connected listings kept inactive because of the plan. |  |
| **active_listing_limit** | **Integer** | The plan&#39;s cap on active listings. |  |
| **message** | **String** |  |  |
| **fix** | **String** |  |  |
| **billing_url** | **String** |  |  |
| **starter_listings** | **Integer** | On a free plan: the listings Starter checkout bills today, the active ones across the plan&#39;s workspaces. Held-back listings are not included: upgrading does not switch them on. | [optional] |
| **starter_monthly_price** | **Float** | Starter&#39;s monthly price in USD for &#x60;starterListings&#x60; — exactly what checkout charges. Each listing switched on afterwards adds Starter&#39;s per-listing price ($5 a month from the 11th to the 100th). Present up to 100 connected listings; above that the message says how to ask for a plan. | [optional] |
| **checkout_url** | **String** | Opens Starter checkout at &#x60;starterMonthlyPrice&#x60;. Present up to 100 listings. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PlanNotice.new(
  code: null,
  active_listing_count: 12,
  listings_held_back: 40,
  active_listing_limit: 3,
  message: 40 more connected listings are held inactive because your plan allows 3 active listings. They stay connected and keep syncing. Upgrade to Starter ($99 a month, 10 listings included), then choose which listings to switch on: $5 a month per listing from the 11th to the 100th: https://repull.dev/dashboard/billing?upgrade&#x3D;starter,
  fix: null,
  billing_url: https://repull.dev/dashboard/billing,
  starter_listings: 3,
  starter_monthly_price: 99,
  checkout_url: https://repull.dev/dashboard/billing?upgrade&#x3D;starter
)
```

