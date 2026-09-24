# Repull::AirbnbPermitsWriteRequestPermitsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **regulatory_body** | **String** | As returned by the GET, e.g. &#x60;maui_county_hawaii&#x60;. |  |
| **regulation_type** | **String** | As returned by the GET. |  |
| **regulation_context** | **String** | Echo the GET&#39;s &#x60;regulation_context&#x60; (e.g. &#x60;initial&#x60;) when present. | [optional] |
| **flow_slug** | **String** | The &#x60;slug&#x60; of the flow you are answering, e.g. &#x60;existing_registration&#x60; or &#x60;exemption_claim&#x60;. |  |
| **answers** | [**Hash&lt;String, AirbnbPermitsWriteRequestPermitsInnerAnswersValue&gt;**](AirbnbPermitsWriteRequestPermitsInnerAnswersValue.md) | Keyed by each question&#39;s &#x60;answer_key&#x60;. Each value carries exactly one field, chosen by the question&#39;s &#x60;type&#x60;: TEXT → &#x60;text_value&#x60;, ATTESTATION → &#x60;attestation_value&#x60;, RADIO → &#x60;radio_value&#x60;, DATE → &#x60;date_value&#x60;, SELECT → &#x60;selected_options_value&#x60;. |  |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbPermitsWriteRequestPermitsInner.new(
  regulatory_body: null,
  regulation_type: null,
  regulation_context: null,
  flow_slug: null,
  answers: null
)
```

