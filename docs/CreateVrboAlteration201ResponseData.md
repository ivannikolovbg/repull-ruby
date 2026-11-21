# Repull::CreateVrboAlteration201ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_code** | **String** |  | [optional] |
| **preview** | **Boolean** |  | [optional] |
| **committed** | **Boolean** |  | [optional] |
| **before** | [**CreateVrboAlteration200ResponseDataBefore**](CreateVrboAlteration200ResponseDataBefore.md) |  | [optional] |
| **after** | [**CreateVrboAlteration200ResponseDataBefore**](CreateVrboAlteration200ResponseDataBefore.md) |  | [optional] |
| **payment** | [**CreateVrboAlteration200ResponseDataPayment**](CreateVrboAlteration200ResponseDataPayment.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateVrboAlteration201ResponseData.new(
  confirmation_code: null,
  preview: null,
  committed: null,
  before: null,
  after: null,
  payment: null
)
```

