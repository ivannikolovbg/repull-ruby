# Repull::CreateConnectionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redirect_url** | **String** | Airbnb + Booking.com — where to redirect the user after they finish the hosted connect flow. | [optional] |
| **access_type** | **String** | Airbnb only — selects the OAuth scope set. &#39;read_only&#39; grants read-only scopes; &#39;messaging&#39; grants read scopes plus message read/send but NOT property management, so it can coexist with another app (e.g. an existing PMS) that already holds property management on the same Airbnb account; &#39;full_access&#39; (default) grants full host scopes including the exclusive property management (only one app per Airbnb account can hold it). | [optional][default to &#39;full_access&#39;] |
| **api_key** | **String** | PMS providers — API key. | [optional] |
| **client_id** | **String** | Plumguide — client ID. | [optional] |
| **client_secret** | **String** | Plumguide — client secret. | [optional] |
| **locale** | **String** | Airbnb only — optional UI language for the hosted Connect pages. Accepts any supported locale code (currently &#x60;en&#x60;, &#x60;fr&#x60;); unknown codes are ignored and resolution falls back to the workspace &#x60;default_language&#x60;, then &#x60;Accept-Language&#x60;, then &#x60;en&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConnectionRequest.new(
  redirect_url: null,
  access_type: null,
  api_key: null,
  client_id: null,
  client_secret: null,
  locale: fr
)
```

