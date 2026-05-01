# Repull::ConnectHost

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **display_name** | **String** | Short display name (Airbnb first name). | [optional] |
| **display_name_long** | **String** | Preferred long-form name. Falls back to displayName when the host hasn&#39;t set a preferred form. | [optional] |
| **avatar_url** | **String** | Profile picture URL (small). | [optional] |
| **avatar_url_large** | **String** | Profile picture URL (large). | [optional] |
| **activation_status** | **String** | Per-provider activation/onboarding status. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectHost.new(
  display_name: Lidia,
  display_name_long: Lidia,
  avatar_url: null,
  avatar_url_large: null,
  activation_status: active
)
```

