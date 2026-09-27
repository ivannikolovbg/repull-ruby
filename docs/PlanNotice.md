# Repull::PlanNotice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** |  |  |
| **listings_held_back** | **Integer** | Connected listings kept inactive because of the plan. |  |
| **active_listing_limit** | **Integer** | The plan&#39;s cap on active listings. |  |
| **message** | **String** |  |  |
| **fix** | **String** |  |  |
| **billing_url** | **String** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::PlanNotice.new(
  code: null,
  listings_held_back: 40,
  active_listing_limit: 3,
  message: 40 more connected listings are held inactive because your plan allows 3 active listings. They stay connected and keep syncing.,
  fix: null,
  billing_url: https://repull.dev/dashboard/billing
)
```

