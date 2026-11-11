# Repull::GetReservationSummary200ResponseTotalsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **month** | **String** | Present when grouped by &#x60;month&#x60; (YYYY-MM). | [optional] |
| **listing_id** | **String** | Present when grouped by &#x60;listing&#x60;. | [optional] |
| **listing_name** | **String** | Present when grouped by &#x60;listing&#x60;. | [optional] |
| **channel** | **String** | Present when grouped by &#x60;channel&#x60;. | [optional] |
| **currency** | **String** | Money is never added across currencies: a period with two currencies has one row per currency. |  |
| **reservations** | **Integer** | Guest stays with at least one night counted (owner stays are in &#x60;ownerStays&#x60;). |  |
| **nights** | **Integer** | Guest nights counted. |  |
| **revenue** | **Float** | What guests paid (&#x60;financials.totalPrice&#x60;). With &#x60;basis&#x3D;stay&#x60;, a stay that crosses the window or a month edge brings only the share of its nights inside. |  |
| **payout** | **Float** | What the host receives (&#x60;financials.host.revenue&#x60;), for reservations where it is known. |  |
| **reservations_with_payout** | **Integer** | How many reservations &#x60;payout&#x60; covers. | [optional] |
| **average_nightly_rate** | **Float** | Accommodation per night (revenue per night when the accommodation subtotal is unknown). | [optional] |
| **average_stay_nights** | **Float** |  | [optional] |
| **average_lead_time_days** | **Float** | Days between booking and check-in. | [optional] |
| **occupancy** | **Float** | Guest nights / available nights, 0–1. Only with &#x60;basis&#x3D;stay&#x60;, and not when grouped by &#x60;channel&#x60;. Blocked nights are not subtracted from availability. | [optional] |
| **available_nights** | **Float** | Active listings × days in the period (one listing per row when grouped by &#x60;listing&#x60;). | [optional] |
| **cancelled** | **Integer** |  |  |
| **cancelled_revenue** | **Float** |  | [optional] |
| **pending** | **Integer** | Requests awaiting an answer; not in revenue or nights. |  |
| **owner_stays** | **Integer** |  |  |
| **owner_nights** | **Integer** |  |  |

## Example

```ruby
require 'repull'

instance = Repull::GetReservationSummary200ResponseTotalsInner.new(
  month: 2026-12,
  listing_id: 4011,
  listing_name: Lakeside Cabin,
  channel: airbnb,
  currency: CAD,
  reservations: 212,
  nights: 1104,
  revenue: 18250.4,
  payout: 18250.4,
  reservations_with_payout: null,
  average_nightly_rate: 178.5,
  average_stay_nights: 5.2,
  average_lead_time_days: 41,
  occupancy: 0.6431,
  available_nights: 1716,
  cancelled: 18,
  cancelled_revenue: 18250.4,
  pending: 2,
  owner_stays: 3,
  owner_nights: 12
)
```

