# Repull::AirbnbHostReviewSubmit

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **public_review** | **String** | Shown publicly on the guest&#39;s profile. &#x60;comment&#x60; is accepted as an alias. |  |
| **rating** | **Integer** | Used for every category not rated in &#x60;categoryRatings&#x60;. | [optional] |
| **category_ratings** | [**Array&lt;AirbnbHostReviewSubmitCategoryRatingsInner&gt;**](AirbnbHostReviewSubmitCategoryRatingsInner.md) | Per-category scores. Categories not listed take &#x60;rating&#x60;; without &#x60;rating&#x60;, all three must be listed. | [optional] |
| **private_feedback** | **String** | Optional. A note to the guest that is not published. | [optional] |
| **is_reviewee_recommended** | **Boolean** | Required. Whether you would host this guest again. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbHostReviewSubmit.new(
  public_review: Joanne was a great guest. The space was kept clean and communication was clear.,
  rating: 5,
  category_ratings: null,
  private_feedback: null,
  is_reviewee_recommended: null
)
```

