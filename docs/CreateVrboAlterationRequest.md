# Repull::CreateVrboAlterationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_code** | **String** |  |  |
| **check_in** | **Date** |  | [optional] |
| **check_out** | **Date** |  | [optional] |
| **check_in_time** | **String** |  | [optional] |
| **check_out_time** | **String** |  | [optional] |
| **number_of_adults** | **Integer** |  | [optional] |
| **number_of_children** | **Integer** |  | [optional] |
| **pets** | **Boolean** |  | [optional] |
| **rent_amount** | **Float** | The new rent for the stay, in the booking&#39;s currency; Vrbo adds its fees and taxes. | [optional] |
| **keep_original_price** | **Boolean** | Change the stay without changing what the guest pays. | [optional] |
| **payment_due_date** | **Date** | When the guest must pay any difference (Vrbo&#39;s default otherwise). | [optional] |
| **preview** | **Boolean** | Vrbo&#39;s dry run only: nothing is changed. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateVrboAlterationRequest.new(
  confirmation_code: HA-8K2P3Q,
  check_in: null,
  check_out: null,
  check_in_time: 16:00,
  check_out_time: 11:00,
  number_of_adults: null,
  number_of_children: null,
  pets: null,
  rent_amount: null,
  keep_original_price: null,
  payment_due_date: null,
  preview: null
)
```

