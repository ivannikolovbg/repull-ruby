# Repull::CreateVrboAlteration200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_code** | **String** |  | [optional] |
| **preview** | **Boolean** |  | [optional] |
| **before** | [**CreateVrboAlteration200ResponseDataBefore**](CreateVrboAlteration200ResponseDataBefore.md) |  | [optional] |
| **after** | [**CreateVrboAlteration200ResponseDataBefore**](CreateVrboAlteration200ResponseDataBefore.md) |  | [optional] |
| **price_unchanged** | **Boolean** |  | [optional] |
| **payment** | [**CreateVrboAlteration200ResponseDataPayment**](CreateVrboAlteration200ResponseDataPayment.md) |  | [optional] |
| **due_date** | [**CreateVrboAlteration200ResponseDataDueDate**](CreateVrboAlteration200ResponseDataDueDate.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateVrboAlteration200ResponseData.new(
  confirmation_code: null,
  preview: null,
  before: null,
  after: null,
  price_unchanged: null,
  payment: null,
  due_date: null
)
```

