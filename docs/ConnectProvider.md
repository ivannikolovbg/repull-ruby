# Repull::ConnectProvider

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Stable identifier passed back to /select-provider and used in /v1/connect/{provider} routes. |  |
| **display_name** | **String** |  |  |
| **category** | **String** | Channel category — OTAs are listing marketplaces; PMSes are property management systems. |  |
| **connect_pattern** | **String** | How the host is connected. &#x60;oauth&#x60;: provider-side consent screen. &#x60;credentials&#x60;: hosted form collects API keys. &#x60;activation&#x60;: push-only handshake (Vrbo). &#x60;claim&#x60;: connectivity-provider designation in the channel&#39;s Extranet (Booking.com). |  |
| **status** | **String** | Pickers should hide / disable &#x60;coming-soon&#x60; cards. &#x60;beta&#x60; cards are clickable but show a Beta pill. |  |
| **logo_url** | **String** | Logo URL — Clearbit stand-in until self-hosted SVGs land. |  |
| **description** | **String** |  |  |
| **docs_url** | **String** |  |  |
| **aliases** | **Array&lt;String&gt;** | Optional friendly aliases the picker&#39;s search box can match. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ConnectProvider.new(
  id: airbnb,
  display_name: Airbnb,
  category: null,
  connect_pattern: null,
  status: null,
  logo_url: null,
  description: OAuth consent — host approves access in one click.,
  docs_url: https://repull.dev/docs/channels/airbnb,
  aliases: [&quot;airbnb&quot;,&quot;abnb&quot;]
)
```

