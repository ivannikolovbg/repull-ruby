# Repull::CreateConnectSessionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redirect_url** | **String** | Where to send the user after they finish (or cancel). Status query params are appended. |  |
| **state** | **String** | Your own correlation token, e.g. your user id (at most 500 characters). Echoed in this response, on the redirect back (&#x60;&amp;state&#x3D;&#x60;), in the popup message, and in the &#x60;connect.session.completed&#x60; webhook. | [optional] |
| **reservation_history_months** | **Integer** | Airbnb — how many months of past reservations the first import pulls (1–60). Omit it for the default window. Upcoming stays are always imported. A wider window takes longer to import, because every extra month is more stays to fetch. | [optional] |
| **mapping** | **String** | Where the channel&#39;s units get linked to listings. &#x60;hosted&#x60; (default): after a Vrbo or Booking.com Extranet sign-in, Connect shows a mapping step and returns to &#x60;redirectUrl&#x60; when it&#39;s confirmed. &#x60;api&#x60;: Connect skips that step and finishes right after sign-in. The connection reaches you in the &#x60;connect.session.completed&#x60; webhook (and as &#x60;connectionId&#x60; in the popup message), its handle is &#x60;vrbo:{connectionId}&#x60; or &#x60;booking_extranet:{connectionId}&#x60;; you list the units with &#x60;GET /v1/connections/{id}/units&#x60; and link them with &#x60;POST /v1/connections/{id}/mappings&#x60;. Nothing is imported until you post the mappings. Other providers ignore it. | [optional][default to &#39;hosted&#39;] |
| **access_type** | **String** | What the connection may do. Airbnb: the OAuth scope tier. Vrbo: &#x60;messaging&#x60; (or &#x60;read_only&#x60;) imports bookings and messages and never pushes the calendar; &#x60;full_access&#x60; also pushes prices and availability. Setting it locks the choice; omit it to let the host choose on the hosted page (default &#x60;full_access&#x60;). | [optional] |
| **allowed_providers** | **Array&lt;String&gt;** | Optional whitelist of provider IDs the picker should expose. Omit to show every channel in the registry. | [optional] |
| **include_request_only** | **Boolean** | Also list PMSes Repull doesn&#39;t connect yet (&#x60;status: request-only&#x60; in &#x60;GET /v1/connect/providers?includeRequestOnly&#x3D;true&#x60;), plus an Other PMS card. Picking one opens a form that collects the host&#39;s contact and access details for the Repull team and ends with \&quot;A team member will contact you\&quot;. No connection is made: the redirect carries &#x60;status&#x3D;requested&amp;provider&#x3D;&lt;id&gt;&#x60;, and no &#x60;connect.session.completed&#x60; webhook fires. Naming a request-only id in &#x60;allowedProviders&#x60; offers it without this flag. | [optional][default to false] |
| **locale** | **String** | Optional UI language for the hosted Connect pages. Accepts any supported locale code (currently &#x60;en&#x60;, &#x60;fr&#x60;). When set it pins the language for the whole flow, overriding the workspace &#x60;default_language&#x60;. Unknown codes are ignored and the page falls back to the workspace default, then &#x60;Accept-Language&#x60;, then &#x60;en&#x60;. The end user can still override per-visit with a &#x60;?locale&#x3D;&#x60; query param on the hosted page. | [optional] |
| **purpose** | **String** | &#x60;migrate&#x60; starts a Repull Migrate session: the property manager connects their current PMS (or channel) and their data is copied into a new workspace of theirs, which you read with &#x60;X-Workspace-Id&#x60;. The hosted pages use migration wording, and after connecting they show the import&#39;s progress. | [optional][default to &#39;connect&#39;] |
| **workspace** | [**CreateConnectSessionRequestWorkspace**](CreateConnectSessionRequestWorkspace.md) |  | [optional] |
| **copy** | [**CreateConnectSessionRequestCopy**](CreateConnectSessionRequestCopy.md) |  | [optional] |
| **scope** | **Array&lt;String&gt;** | Migrate only — what you want brought across, listed to the property manager before they connect. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::CreateConnectSessionRequest.new(
  redirect_url: null,
  state: null,
  reservation_history_months: 24,
  mapping: null,
  access_type: null,
  allowed_providers: null,
  include_request_only: null,
  locale: fr,
  purpose: null,
  workspace: null,
  copy: null,
  scope: null
)
```

