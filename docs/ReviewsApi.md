# Repull::ReviewsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_review**](ReviewsApi.md#get_review) | **GET** /v1/reviews/{id} | Get review |
| [**list_reviews**](ReviewsApi.md#list_reviews) | **GET** /v1/reviews | List reviews |
| [**reply_to_review**](ReviewsApi.md#reply_to_review) | **POST** /v1/reviews/{id}/reply | Reply to a review on any channel |
| [**submit_guest_review**](ReviewsApi.md#submit_guest_review) | **POST** /v1/reviews/{id}/guest-review | Review a guest (publishes, final) |


## get_review

> <Review> get_review(id, opts)

Get review

Returns one review (the bare `Review` object — NOT wrapped in `{ data: ... }`). Scoped to the authenticated workspace via the listings join — reviews that don't belong to the workspace return 404 (we don't differentiate to avoid leaking other customers' ids).  A review of an inactive listing returns `403 listing_inactive`. Inactive listings keep syncing; activate the listing to use it here.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReviewsApi.new
id = 56 # Integer | Internal Repull review id.
opts = {
  x_schema: 'my-app-schema' # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
}

begin
  # Get review
  result = api_instance.get_review(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->get_review: #{e}"
end
```

#### Using the get_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Review>, Integer, Hash)> get_review_with_http_info(id, opts)

```ruby
begin
  # Get review
  data, status_code, headers = api_instance.get_review_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Review>
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->get_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull review id. |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |

### Return type

[**Review**](Review.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_reviews

> <ReviewListResponse> list_reviews(opts)

List reviews

Cursor-paginated guest + host review stream for the workspace. This surface returns the complete cross-channel history — separate from `/v1/channels/airbnb/reviews` which hits Airbnb live.  `?offset=` is also accepted as a first-class alias for shallow paging (0..10000) — see the `offset` parameter below. Mutually exclusive with `cursor`.  Filters: `platform` (`airbnb`|`booking`|`vrbo`), `listing_id` (internal Repull listing id), `rating_min` / `rating_max` (inclusive bounds, 0..5), `status` (`responded`|`unanswered`|`all`), `reviewer_role` (`guest` (default) | `host` | `all`).  **Inactive listings:** reviews of inactive listings are left out of the page and of `pagination.total`. Filtering by an inactive `listing_id` returns `403 listing_inactive`. Inactive listings keep syncing; activate the listing to use it here.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReviewsApi.new
opts = {
  account: 'airbnb:79730216', # String | Only the records of one connected account, as `provider:externalAccountId` — the pair from a webhook `account` block, `connect.session.completed`, or `GET /v1/connect/{provider}` → `accounts`. A record belongs to an account when it is on that account's listings and on its channel (a PMS account: came in through that PMS). An account with no listings returns an empty page.
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  cursor: 'cursor_example', # String | Opaque cursor returned in the previous response's `pagination.nextCursor`.
  offset: 56, # Integer | First-class alias for cursor-based pagination. Mutually exclusive with `cursor` — passing both returns 422. Accepts integers in `[0, 10000]`; deeper walks must use `cursor` (constant per-page cost). The response always includes `pagination.nextCursor` so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying.
  limit: 56, # Integer | 
  platform: 'airbnb', # String | 
  listing_id: 56, # Integer | Restrict to one internal Repull listing.
  rating_min: 8.14, # Float | 
  rating_max: 8.14, # Float | 
  status: 'responded', # String | `responded` — host has replied. `unanswered` — host has not replied. `all` — no filter.
  reviewer_role: 'guest' # String | `guest` (default) — reviews written by guests about the host/property. `host` — reviews written by the host about guests. `all` — both.
}

begin
  # List reviews
  result = api_instance.list_reviews(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->list_reviews: #{e}"
end
```

#### Using the list_reviews_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReviewListResponse>, Integer, Hash)> list_reviews_with_http_info(opts)

```ruby
begin
  # List reviews
  data, status_code, headers = api_instance.list_reviews_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReviewListResponse>
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->list_reviews_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account** | **String** | Only the records of one connected account, as &#x60;provider:externalAccountId&#x60; — the pair from a webhook &#x60;account&#x60; block, &#x60;connect.session.completed&#x60;, or &#x60;GET /v1/connect/{provider}&#x60; → &#x60;accounts&#x60;. A record belongs to an account when it is on that account&#39;s listings and on its channel (a PMS account: came in through that PMS). An account with no listings returns an empty page. | [optional] |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **cursor** | **String** | Opaque cursor returned in the previous response&#39;s &#x60;pagination.nextCursor&#x60;. | [optional] |
| **offset** | **Integer** | First-class alias for cursor-based pagination. Mutually exclusive with &#x60;cursor&#x60; — passing both returns 422. Accepts integers in &#x60;[0, 10000]&#x60;; deeper walks must use &#x60;cursor&#x60; (constant per-page cost). The response always includes &#x60;pagination.nextCursor&#x60; so consumers can switch from offset → cursor mid-walk for deep pagination without re-keying. | [optional][default to 0] |
| **limit** | **Integer** |  | [optional][default to 20] |
| **platform** | **String** |  | [optional] |
| **listing_id** | **Integer** | Restrict to one internal Repull listing. | [optional] |
| **rating_min** | **Float** |  | [optional] |
| **rating_max** | **Float** |  | [optional] |
| **status** | **String** | &#x60;responded&#x60; — host has replied. &#x60;unanswered&#x60; — host has not replied. &#x60;all&#x60; — no filter. | [optional] |
| **reviewer_role** | **String** | &#x60;guest&#x60; (default) — reviews written by guests about the host/property. &#x60;host&#x60; — reviews written by the host about guests. &#x60;all&#x60; — both. | [optional][default to &#39;guest&#39;] |

### Return type

[**ReviewListResponse**](ReviewListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## reply_to_review

> <ReplyToReview201Response> reply_to_review(id, reply_to_review_request)

Reply to a review on any channel

Resolves the review, reads its channel and dispatches the reply. Channel-neutral: you do not need to know where the review came from.  Replies work on Airbnb, Booking.com and VRBO. Each channel accepts one reply per review (VRBO: a second is `409 already_replied`; a review VRBO no longer takes a response to is `409 reply_not_allowed`). On VRBO the response is signed with a name — the connected account's host name, or `name` if you send it. A review from a channel without a reply API returns `422 unsupported_channel` naming the channels that do work.  To review a guest (Airbnb only), use `POST /v1/reviews/{id}/guest-review`.  **Inactive listings:** a review of an inactive listing returns `403 listing_inactive` and no reply reaches the channel. Activate the listing first.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReviewsApi.new
id = 56 # Integer | Internal Repull review id.
reply_to_review_request = Repull::ReplyToReviewRequest.new({message: 'message_example'}) # ReplyToReviewRequest | 

begin
  # Reply to a review on any channel
  result = api_instance.reply_to_review(id, reply_to_review_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->reply_to_review: #{e}"
end
```

#### Using the reply_to_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReplyToReview201Response>, Integer, Hash)> reply_to_review_with_http_info(id, reply_to_review_request)

```ruby
begin
  # Reply to a review on any channel
  data, status_code, headers = api_instance.reply_to_review_with_http_info(id, reply_to_review_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReplyToReview201Response>
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->reply_to_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Internal Repull review id. |  |
| **reply_to_review_request** | [**ReplyToReviewRequest**](ReplyToReviewRequest.md) |  |  |

### Return type

[**ReplyToReview201Response**](ReplyToReview201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_guest_review

> <SubmitGuestReview200Response> submit_guest_review(id, airbnb_host_review_submit)

Review a guest (publishes, final)

Submit your review of a guest — a review with `reviewerRole: \"host\"` from `GET /v1/reviews?reviewerRole=host`. Only Airbnb lets hosts review guests; a review from another channel returns `422 unsupported_channel`.  **Submitting publishes it and is final:** Airbnb has no draft and does not allow edits; a second submission is `409 review_already_submitted`. Airbnb accepts it up to 14 days after checkout (`expiresAt`); after that, `409 review_window_closed`.  Required: `publicReview`, `isRevieweeRecommended` (whether you would host the guest again), and a 1–5 rating for **each** of `cleanliness`, `communication` and `respect_house_rules` — send `rating` to use one score for all three, `categoryRatings` to score them individually, or both (`rating` fills any category you did not rate). Optional: `privateFeedback`, a note to the guest that is not published. A request missing a required piece is refused with `422 invalid_params` naming it, before anything is sent to Airbnb.  ```json {   \"publicReview\": \"Joanne was a great guest.\",   \"rating\": 5,   \"privateFeedback\": \"Thanks for leaving the place so tidy!\",   \"isRevieweeRecommended\": true } ```  A guest's review of you (`reviewerRole: \"guest\"`) cannot be written here — `409 not_host_review`; answer it with `POST /v1/reviews/{id}/reply`. Same behaviour as `PUT /v1/channels/airbnb/reviews/{id}`. Guide: https://repull.dev/docs/reviews#review-a-guest

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::ReviewsApi.new
id = 56 # Integer | The review `id` from `GET /v1/reviews`.
airbnb_host_review_submit = Repull::AirbnbHostReviewSubmit.new({public_review: 'Joanne was a great guest. The space was kept clean and communication was clear.', is_reviewee_recommended: false}) # AirbnbHostReviewSubmit | 

begin
  # Review a guest (publishes, final)
  result = api_instance.submit_guest_review(id, airbnb_host_review_submit)
  p result
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->submit_guest_review: #{e}"
end
```

#### Using the submit_guest_review_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitGuestReview200Response>, Integer, Hash)> submit_guest_review_with_http_info(id, airbnb_host_review_submit)

```ruby
begin
  # Review a guest (publishes, final)
  data, status_code, headers = api_instance.submit_guest_review_with_http_info(id, airbnb_host_review_submit)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitGuestReview200Response>
rescue Repull::ApiError => e
  puts "Error when calling ReviewsApi->submit_guest_review_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The review &#x60;id&#x60; from &#x60;GET /v1/reviews&#x60;. |  |
| **airbnb_host_review_submit** | [**AirbnbHostReviewSubmit**](AirbnbHostReviewSubmit.md) |  |  |

### Return type

[**SubmitGuestReview200Response**](SubmitGuestReview200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

