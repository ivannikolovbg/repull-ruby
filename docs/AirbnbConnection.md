# Repull::AirbnbConnection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Connection row id | [optional] |
| **airbnb_id** | **String** | Airbnb-side listing id | [optional] |
| **account_id** | **String** | Which connected Airbnb account this row belongs to — the Airbnb host id, as a string (they exceed 2^53). The same value &#x60;?account_id&#x3D;&#x60; accepts and &#x60;GET /v1/connect/airbnb&#x60; returns as &#x60;accounts[].externalAccountId&#x60;. | [optional] |
| **account_name** | **String** | Display name of that connected Airbnb account. | [optional] |
| **host_id** | **String** | Alias of &#x60;accountId&#x60;, kept for compatibility — same Airbnb host id, same string. | [optional] |
| **host_name** | **String** | Alias of &#x60;accountName&#x60;, kept for compatibility. | [optional] |
| **active** | **Boolean** |  | [optional] |
| **sync_enabled** | **Boolean** |  | [optional] |
| **primary** | **Boolean** |  | [optional] |
| **markup** | **String** | The Airbnb markup as a fraction: \&quot;0.35\&quot; &#x3D; +35% on the listing&#39;s own price. Read or set it as a percentage with &#x60;/v1/listings/{id}/markups&#x60;. | [optional] |
| **sync_category** | **String** | Airbnb&#39;s own API sync decision for THIS listing, as Airbnb reports it. Airbnb authorises sync one listing at a time, so a connected account can still contain listings it will not accept writes for.  - &#x60;sync_all&#x60; — Repull manages content, rates and availability. - &#x60;sync_rates_and_availability&#x60; — Repull manages rates and availability; listing content is managed by the host on Airbnb. - &#x60;none&#x60; — the listing is **not** connected to Repull on Airbnb&#39;s side. Every write to it is refused with &#x60;403 listing_not_api_connected&#x60;; reconnecting the Airbnb account does not change this, the host must switch the listing on in Airbnb.  &#x60;null&#x60; when the listing has not synced yet. Not to be confused with &#x60;syncEnabled&#x60;, which is a Repull-side flag and says nothing about what Airbnb accepts. | [optional] |
| **writable** | **Boolean** | Whether Repull will send a write for this listing to Airbnb. &#x60;false&#x60; exactly when &#x60;syncCategory&#x60; is &#x60;none&#x60; — such a write is refused with &#x60;403 listing_not_api_connected&#x60; before anything reaches Airbnb. Check this before a portfolio-wide push instead of discovering it one 403 at a time. | [optional] |
| **created_at** | **Time** |  | [optional] |
| **locked_fields** | **Array&lt;String&gt;** | Fields Airbnb will NOT let you change on this listing — &#x60;property_type_category&#x60;, &#x60;name&#x60;, &#x60;check_in_option&#x60;, &#x60;summary&#x60;, &#x60;space&#x60;, individual amenities, … Airbnb does not refuse a write to a locked field: it returns 200, reports the field as locked, and applies nothing. Check this before a content write; &#x60;[]&#x60; means nothing is known to be locked. Recorded at sync time, so a lock added on Airbnb since the last sync will show up on the write instead (as &#x60;blockedFields&#x60; in the response). | [optional] |
| **amenities** | [**Array&lt;AirbnbConnectionAmenitiesInner&gt;**](AirbnbConnectionAmenitiesInner.md) | Present only when &#x60;?include&#x3D;amenities&#x60; is passed. Sourced from the local &#x60;listings_airbnb_amenities&#x60; cache (populated by the Airbnb sync worker). Returns &#x60;null&#x60; when the cache is empty for this connection — see the top-level &#x60;dataFreshness&#x60; envelope to disambiguate \&quot;never synced\&quot; vs \&quot;host disconnected\&quot; vs \&quot;fresh and genuinely empty\&quot;. | [optional] |
| **accessibility_amenities** | [**Array&lt;AirbnbConnectionAccessibilityAmenitiesInner&gt;**](AirbnbConnectionAccessibilityAmenitiesInner.md) | Present only when &#x60;?include&#x3D;amenities&#x60; is passed. Accessibility-tagged subset of the local amenity cache (step-free access, wide doorways, grab rails, disabled parking, wheelchair, accessible-height fixtures, hoists, etc). Returns an empty array when amenities synced but none qualify as accessibility; returns &#x60;null&#x60; when the cache is empty for this connection (use &#x60;dataFreshness&#x60; to disambiguate \&quot;never synced\&quot; from \&quot;fresh and genuinely empty\&quot;). | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::AirbnbConnection.new(
  id: null,
  airbnb_id: 1116939745194659457,
  account_id: 1772489413932732258,
  account_name: Pomello,
  host_id: null,
  host_name: null,
  active: null,
  sync_enabled: null,
  primary: null,
  markup: null,
  sync_category: sync_all,
  writable: true,
  created_at: null,
  locked_fields: [&quot;name&quot;,&quot;summary&quot;,&quot;property_type_category&quot;],
  amenities: null,
  accessibility_amenities: null
)
```

