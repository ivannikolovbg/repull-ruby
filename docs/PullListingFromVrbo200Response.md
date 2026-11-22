# Repull::PullListingFromVrbo200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **channel** | **String** |  | [optional] |
| **connection_id** | **String** | The Vrbo account the values came from. | [optional] |
| **external_id** | **String** | The Vrbo listing number. | [optional] |
| **refreshed_from_channel** | **Boolean** | True when Vrbo answered and at least one section was refreshed. | [optional] |
| **sections** | **Array&lt;String&gt;** | Sections refreshed from Vrbo. | [optional] |
| **failed_sections** | **Array&lt;String&gt;** | Sections Vrbo did not return this time; their stored copy is unchanged. | [optional] |
| **pulled_at** | **Time** |  | [optional] |
| **next_pull_available_at** | **Time** | Earliest time another pull of this listing is accepted. | [optional] |
| **min_interval_seconds** | **Integer** |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::PullListingFromVrbo200Response.new(
  listing_id: null,
  channel: null,
  connection_id: null,
  external_id: null,
  refreshed_from_channel: null,
  sections: [&quot;descriptions&quot;,&quot;house-rules&quot;,&quot;fees&quot;],
  failed_sections: null,
  pulled_at: null,
  next_pull_available_at: null,
  min_interval_seconds: 900
)
```

