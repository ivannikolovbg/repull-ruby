# Repull::AirbnbConnectionSummary

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | &#x60;connected&#x60; — every host is currently connected. &#x60;reconnect_required&#x60; — at least one host is connected, at least one is not. &#x60;disconnected&#x60; — every host has been disconnected. &#x60;never_connected&#x60; — the workspace has never linked an Airbnb account. |  |
| **host_count** | **Integer** |  |  |
| **hosts** | [**Array&lt;AirbnbConnectionHost&gt;**](AirbnbConnectionHost.md) |  |  |
| **fix_url** | **String** | Self-serve recovery URL. Set whenever &#x60;status&#x60; is anything other than &#x60;connected&#x60;. Points at the dashboard surface where the host re-authorizes (or initiates the first OAuth flow for &#x60;never_connected&#x60; workspaces). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbConnectionSummary.new(
  status: null,
  host_count: 2,
  hosts: null,
  fix_url: https://repull.dev/dashboard/connections/airbnb
)
```

