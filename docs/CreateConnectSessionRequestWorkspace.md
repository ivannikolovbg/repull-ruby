# Repull::CreateConnectSessionRequestWorkspace

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **external_ref** | **String** | Your own id for this property manager. Returned on every migration read. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConnectSessionRequestWorkspace.new(
  name: Seaside Rentals,
  external_ref: acct_8812
)
```

