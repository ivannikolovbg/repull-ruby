# Repull::SubmitMewsCredentialsRequestCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **access_token** | **String** | The property&#39;s Connector API access token. |  |
| **environment** | **String** | &#x60;demo&#x60; targets Mews&#39;s public demo environment. | [optional][default to &#39;production&#39;] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitMewsCredentialsRequestCredentials.new(
  access_token: null,
  environment: null
)
```

