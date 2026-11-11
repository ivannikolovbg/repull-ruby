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
| **starter_listings** | **Integer** | On a free plan: the listings Starter would serve and bill, active plus held back, across the plan&#39;s workspaces. | [optional] |
| **starter_monthly_price** | **Float** | Starter&#39;s monthly price in USD for &#x60;starterListings&#x60; — exactly what checkout charges. Present up to 100 listings; above that the message says how to ask for a plan. | [optional] |
| **checkout_url** | **String** | Opens Starter checkout at &#x60;starterMonthlyPrice&#x60;. Present up to 100 listings. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PlanNotice.new(
  code: null,
  active_listing_count: 12,
  listings_held_back: 40,
  active_listing_limit: 3,
  message: 40 more connected listings are held inactive because your plan allows 3 active listings. They stay connected and keep syncing. Starter serves all 43 for $264 a month: https://repull.dev/dashboard/billing?upgrade&#x3D;starter,
  fix: null,
  billing_url: https://repull.dev/dashboard/billing,
  starter_listings: 43,
  starter_monthly_price: 264,
  checkout_url: https://repull.dev/dashboard/billing?upgrade&#x3D;starter
)
```

