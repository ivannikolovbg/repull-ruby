# Repull::GetListingMarkups200ResponseVrboInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The Vrbo account this listing&#39;s Vrbo unit is on, as its handle &#x60;vrbo:{Vrbo account id}&#x60;. &#x60;null&#x60; until Vrbo&#39;s account id is captured for the sign-in. | [optional] |
| **vrbo_listing_number** | **String** | The Vrbo listing number this listing is linked to. | [optional] |
| **markup_percent** | **Float** | Percent added to this listing&#39;s price on Vrbo. 5 &#x3D; +5%; negative &#x3D; below the listing&#39;s price. &#x60;null&#x60; &#x3D; none. Other listings on the same Vrbo account have their own. | [optional] |
| **listing_ids** | **Array&lt;String&gt;** | The listing this markup applies to — always just this listing, since a Vrbo markup is per listing. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetListingMarkups200ResponseVrboInner.new(
  account_id: null,
  vrbo_listing_number: null,
  markup_percent: 5,
  listing_ids: null
)
```

