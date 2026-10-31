# Repull::ListingWebhookObjectChannelsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **platform** | **String** |  | [optional] |
| **external_id** | **String** |  | [optional] |
| **active** | **Boolean** |  | [optional] |
| **sync_enabled** | **Boolean** |  | [optional] |
| **sync_category** | **String** |  | [optional] |
| **account** | [**RecordAccount**](RecordAccount.md) | The connected account this listing belongs to on this channel — for Airbnb the host account (&#x60;externalAccountId&#x60; is the Airbnb host id). The same account &#x60;account.disconnected&#x60; names, so a disconnect can be matched to its listings. Null when it cannot be resolved. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingWebhookObjectChannelsInner.new(
  platform: airbnb,
  external_id: 21466093,
  active: null,
  sync_enabled: null,
  sync_category: sync_all,
  account: null
)
```

