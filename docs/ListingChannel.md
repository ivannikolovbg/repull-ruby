# Repull::ListingChannel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **platform** | **String** |  | [optional] |
| **external_id** | **String** | ID in the platform (Airbnb listing id, Booking room id, etc.) | [optional] |
| **active** | **Boolean** |  | [optional] |
| **sync_enabled** | **Boolean** |  | [optional] |
| **account** | [**RecordAccount**](RecordAccount.md) | The connected account this listing belongs to on this channel — for Airbnb the host account (&#x60;externalAccountId&#x60; is the Airbnb host id). The same account &#x60;account.disconnected&#x60; names, so a disconnect can be matched to its listings. Null when it cannot be resolved. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingChannel.new(
  platform: airbnb,
  external_id: null,
  active: null,
  sync_enabled: null,
  account: null
)
```

