# Repull::GetListingMarkups200ResponseVrboInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The Vrbo account, as its handle &#x60;vrbo:{Vrbo account id}&#x60;. &#x60;null&#x60; until Vrbo&#39;s account id is captured for the sign-in. | [optional] |
| **vrbo_listing_number** | **String** | The Vrbo listing number this listing is linked to. | [optional] |
| **markup_percent** | **Float** | Percent added on Vrbo, for every listing linked on this account. | [optional] |
| **listing_ids** | **Array&lt;String&gt;** | Listings in this workspace linked on this Vrbo account — all share this markup. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingMarkups200ResponseVrboInner.new(
  account_id: null,
  vrbo_listing_number: null,
  markup_percent: 20,
  listing_ids: null
)
```

