# Repull::SubmitVrboGuestReviewRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rating** | **Integer** |  | [optional] |
| **category_ratings** | [**Array&lt;SubmitVrboGuestReviewRequestCategoryRatingsInner&gt;**](SubmitVrboGuestReviewRequestCategoryRatingsInner.md) |  | [optional] |
| **is_reviewee_recommended** | **Boolean** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitVrboGuestReviewRequest.new(
  rating: null,
  category_ratings: null,
  is_reviewee_recommended: null
)
```

