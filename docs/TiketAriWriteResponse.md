# Repull::TiketAriWriteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** | Present on &#x60;PUT /v1/channels/tiket/listings/{id}/pricing&#x60;. | [optional] |
| **property_id** | **String** | tiket.com Hotel ID. |  |
| **room_type_code** | **String** | Present on &#x60;PUT /v1/channels/tiket/listings/{id}/pricing&#x60;. | [optional] |
| **type** | **String** |  |  |
| **updates** | **Integer** | Update rows sent (on the listing route, one per targeted rate plan). |  |
| **requests** | **Integer** | Requests made to tiket.com. |  |
| **echo_tokens** | **Array&lt;String&gt;** | tiket.com&#39;s reference for each request. Quote them to tiket.com support. | [optional] |
| **warnings** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | tiket.com&#39;s own warnings, verbatim (for example &#x60;ARI_PARTIALLY_ERROR&#x60; when part of a request was not applied). | [optional] |
| **applied** | **String** | &#x60;verified&#x60; — the read-back matches what was sent. &#x60;mismatch&#x60; — tiket.com holds something else for at least one night (see &#x60;mismatches&#x60;). &#x60;unverified&#x60; — &#x60;verify: false&#x60; was sent. |  |
| **mismatches** | [**Array&lt;TiketAriMismatch&gt;**](TiketAriMismatch.md) | Present when &#x60;applied&#x60; is &#x60;mismatch&#x60;. At most 100; &#x60;mismatchCount&#x60; is the total. | [optional] |
| **mismatch_count** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::TiketAriWriteResponse.new(
  listing_id: null,
  property_id: null,
  room_type_code: null,
  type: null,
  updates: null,
  requests: null,
  echo_tokens: null,
  warnings: null,
  applied: null,
  mismatches: null,
  mismatch_count: null
)
```

