# Repull::ListingPhotoUploadUrlResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **listing_id** | **String** |  | [optional] |
| **upload_url** | **String** | PUT the raw file bytes here directly from the client. Not a Repull or vanio API endpoint — a signed storage URL. | [optional] |
| **token** | **String** | Opaque upload token bound to this signed URL. | [optional] |
| **path** | **String** | Storage path the photo will live at once uploaded. Pass this to &#x60;DELETE /v1/listings/{id}/photos&#x60; to remove it later. | [optional] |
| **public_url** | **String** | Durable public URL for the photo once the upload completes. Attach it to the listing via &#x60;PUT /v1/listings/{id}/content&#x60; (&#x60;photos&#x60; field). | [optional] |
| **expires_in** | **Integer** | Seconds until &#x60;uploadUrl&#x60; expires. Mint a new one via a fresh POST if the upload did not happen in time. | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::ListingPhotoUploadUrlResponse.new(
  listing_id: null,
  upload_url: null,
  token: null,
  path: null,
  public_url: null,
  expires_in: null
)
```

