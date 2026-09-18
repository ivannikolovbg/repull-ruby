# Repull::AirbnbPublishResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **published** | **Boolean** | True only when EVERY attempted section reached Airbnb. |  |
| **sections** | **Array&lt;String&gt;** | Sections that landed on Airbnb. |  |
| **errors** | [**Array&lt;PublishSectionError&gt;**](PublishSectionError.md) | Per-section failures. Empty when &#x60;published&#x60; is true. |  |
| **reason** | **String** | Set when the publish never started at all (no connection, address missing, subscription gate). | [optional] |
| **locked_fields** | **Array&lt;String&gt;** | Fields Airbnb will not let this listing change — collected from the failures above and from the &#x60;locked_attributes&#x60; Airbnb recorded for the listing. Sending them again returns success and changes nothing. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbPublishResult.new(
  published: null,
  sections: [&quot;details&quot;,&quot;pricing&quot;,&quot;photos&quot;],
  errors: null,
  reason: null,
  locked_fields: null
)
```

