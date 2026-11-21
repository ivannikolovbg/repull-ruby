# Repull::GetVrboListingAmenities200ResponseDataGroupsValueFieldsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The field id to write in &#x60;values&#x60;. | [optional] |
| **type** | **String** |  | [optional] |
| **title** | **String** |  | [optional] |
| **section** | **String** |  | [optional] |
| **value** | [**GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerValue**](GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerValue.md) |  | [optional] |
| **options** | [**Array&lt;GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner&gt;**](GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerOptionsInner.md) |  | [optional] |
| **min** | **Float** |  | [optional] |
| **max** | **Float** |  | [optional] |
| **max_length** | **Integer** |  | [optional] |
| **shown_when** | [**GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerShownWhen**](GetVrboListingAmenities200ResponseDataGroupsValueFieldsInnerShownWhen.md) |  | [optional] |

## Example

```ruby
require 'repull'

instance = Repull::GetVrboListingAmenities200ResponseDataGroupsValueFieldsInner.new(
  id: haveInternet:yes:haveWifi,
  type: null,
  title: null,
  section: null,
  value: null,
  options: null,
  min: null,
  max: null,
  max_length: null,
  shown_when: null
)
```

