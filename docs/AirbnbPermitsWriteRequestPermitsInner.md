# Repull::AirbnbPermitsWriteRequestPermitsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **regulatory_body** | **String** | As returned by the GET, e.g. &#x60;maui_county_hawaii&#x60;. |  |
| **regulation_type** | **String** | As returned by the GET. |  |
| **regulation_context** | **String** | Echo the GET&#39;s &#x60;regulation_context&#x60; (e.g. &#x60;initial&#x60;) when present. | [optional] |
| **flow_slug** | **String** | The &#x60;slug&#x60; of the flow you are answering, e.g. &#x60;existing_registration&#x60; or &#x60;exemption_claim&#x60;. |  |
| **answers** | **Hash&lt;String, Hash&lt;String, Object&gt;&gt;** | Keyed by each question&#39;s &#x60;answer_key&#x60;. Each value carries exactly one &#x60;&lt;type&gt;_value&#x60; field named after the question&#39;s &#x60;type&#x60; (lower-case): &#x60;text_value&#x60;, &#x60;attestation_value&#x60; (boolean), &#x60;radio_value&#x60;, &#x60;dropdown_value&#x60;, &#x60;email_value&#x60;, &#x60;future_date_value&#x60; (YYYY-MM-DD) and &#x60;file_upload_value&#x60; (object with the base64 file) are the ones Airbnb returns in production; other question types follow the same pattern. Airbnb validates the value against its question. Example: &#x60;{\&quot;email\&quot;: {\&quot;email_value\&quot;: \&quot;host@example.com\&quot;}, \&quot;expiration_date\&quot;: {\&quot;future_date_value\&quot;: \&quot;2029-02-04\&quot;}, \&quot;attestation\&quot;: {\&quot;attestation_value\&quot;: true}}&#x60;. |  |

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

