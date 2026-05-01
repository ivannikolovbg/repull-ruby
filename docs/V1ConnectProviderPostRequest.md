# Repull::V1ConnectProviderPostRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redirect_url** | **String** | Airbnb only — where to redirect the user after the OAuth flow completes. | [optional] |
| **access_type** | **String** | Airbnb only — selects the OAuth scope set. &#39;read_only&#39; grants calendar-only access; &#39;full_access&#39; grants full host scopes (default). | [optional][default to &#39;full_access&#39;] |
| **api_key** | **String** | PMS providers — API key. | [optional] |
| **client_id** | **String** | Plumguide — client ID. | [optional] |
| **client_secret** | **String** | Plumguide — client secret. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::V1ConnectProviderPostRequest.new(
  redirect_url: null,
  access_type: null,
  api_key: null,
  client_id: null,
  client_secret: null
)
```

