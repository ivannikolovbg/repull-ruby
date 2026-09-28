# Repull::AirbnbHostReviewSubmitCategoryRatingsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category** | **String** |  |  |
| **rating** | **Integer** |  |  |
| **comment** | **String** | Optional note for this category (Airbnb caps it at 50 characters). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbHostReviewSubmitCategoryRatingsInner.new(
  category: null,
  rating: null,
  comment: null
)
```

