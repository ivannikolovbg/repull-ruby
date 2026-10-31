# Repull::SubmitCiirusCredentialsRequestCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **api_username** | **String** | CiiRUS API username, from the CiiRUS API Explorer or CiiRUS support. |  |
| **api_password** | **String** | CiiRUS API password. |  |
| **management_company_user_id** | **Integer** | The CiiRUS supplier (management company) id, the MCUserID. Only needed when the credentials see several suppliers. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::SubmitCiirusCredentialsRequestCredentials.new(
  api_username: null,
  api_password: null,
  management_company_user_id: 42330
)
```

