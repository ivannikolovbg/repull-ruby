# Repull::CreateConnectionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redirect_url** | **String** | Airbnb, Booking.com and PriceLabs — where to send the user after they finish (or cancel) the hosted connect flow. Every return to it carries &#x60;status&#x60; (&#x60;connected&#x60;, &#x60;cancelled&#x60;, &#x60;error&#x60; with a &#x60;code&#x60;, &#x60;expired&#x60;, &#x60;pending&#x60; when the host chose to finish later, or &#x60;requested&#x60; for a request-only PMS), &#x60;sessionId&#x60; (the id this call returns) and &#x60;state&#x60; when you sent one; a connected return adds &#x60;connectionId&#x60; and &#x60;externalAccountId&#x60; (and &#x60;hostId&#x60; for Airbnb). Your existing query string is kept. | [optional] |
| **access_type** | **String** | Airbnb only — selects the OAuth scope set. &#39;read_only&#39; grants read-only scopes; &#39;messaging&#39; (shown to hosts as \&quot;Messaging &amp; reviews\&quot;) grants read scopes plus message read/send and review writes (reply to guest reviews, submit host reviews — Airbnb&#39;s reviews_write) but NOT property management, so it can coexist with another app (e.g. an existing PMS) that already holds property management on the same Airbnb account; &#39;full_access&#39; (default) grants full host scopes including the exclusive property management (only one app per Airbnb account can hold it). The hosted consent screen normally lets the host pick a tier; passing &#x60;accessType&#x60; explicitly fixes the tier and hides that choice, so the host can only continue with the tier you requested. Omit it to let the host choose. | [optional][default to &#39;full_access&#39;] |
| **reservation_history_months** | **Integer** | Airbnb — how many months of past reservations the first import pulls (1–60). Omit it for the default window. Upcoming stays are always imported. A wider window takes longer to import, because every extra month is more stays to fetch. | [optional] |
| **state** | **String** | Your own correlation token, e.g. your user id (at most 500 characters), for every hosted flow (Airbnb, Booking.com, PriceLabs). Echoed in this response, on every redirect back (&#x60;&amp;state&#x3D;&#x60;, whatever the outcome), in the popup message, and in the &#x60;connect.session.completed&#x60; webhook. Without it, match the return by &#x60;sessionId&#x60;. | [optional] |
| **workspace** | [**CreateConnectionRequestWorkspace**](CreateConnectionRequestWorkspace.md) |  | [optional] |
| **locale** | **String** | Airbnb and Booking.com — optional UI language for the hosted Connect pages. Accepts any supported locale code (currently &#x60;en&#x60;, &#x60;fr&#x60;, &#x60;de&#x60;, &#x60;es&#x60;, &#x60;it&#x60;, &#x60;nl&#x60;); unknown codes are ignored and resolution falls back to the workspace &#x60;default_language&#x60;, then &#x60;Accept-Language&#x60;, then &#x60;en&#x60;. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConnectionRequest.new(
  redirect_url: null,
  access_type: null,
  reservation_history_months: 24,
  state: null,
  workspace: null,
  locale: fr
)
```

