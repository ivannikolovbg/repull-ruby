# Repull::BookingPublishSectionError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **section** | **String** | Which part of the listing this failure is about — e.g. &#x60;details&#x60;, &#x60;description&#x60;, &#x60;amenities&#x60;, &#x60;rooms&#x60;, &#x60;photos&#x60;, &#x60;pricing&#x60;. |  |
| **message** | **String** | Booking.com&#39;s own reason, verbatim, or ours when we refused to send an empty section. |  |
| **code** | **String** | &#x60;no_content&#x60; — there was nothing canonical to send for this section; write the content, then publish again. &#x60;rejected&#x60; — Booking.com refused the section as sent; fix the content, or the property&#39;s Content API permissions, and publish again.  Airbnb&#39;s third code, &#x60;locked&#x60;, has no Booking.com counterpart and never appears here. |  |

## Example

```ruby
require 'repull'

instance = Repull::BookingPublishSectionError.new(
  section: description,
  message: null,
  code: null
)
```

