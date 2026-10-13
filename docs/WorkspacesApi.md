# Repull::WorkspacesApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_workspaces**](WorkspacesApi.md#list_workspaces) | **GET** /v1/workspaces | List workspaces |


## list_workspaces

> <ListWorkspaces200Response> list_workspaces(opts)

List workspaces

Every sub-workspace your workspace has opened, newest first: one per customer of yours, created by `POST /v1/connect` with `workspace` (or by Repull Migrate). Read or write a workspace's data by sending its `workspaceId` as `X-Workspace-Id`. Its webhook events arrive on your own webhook endpoints, tagged with `workspaceId`. Page with `pagination.nextCursor`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::WorkspacesApi.new
opts = {
  limit: 56, # Integer | 
  cursor: 'cursor_example', # String | `pagination.nextCursor` from the previous page.
  external_ref: 'external_ref_example' # String | Only the workspace you tagged with this `externalRef` (your own id for the customer).
}

begin
  # List workspaces
  result = api_instance.list_workspaces(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling WorkspacesApi->list_workspaces: #{e}"
end
```

#### Using the list_workspaces_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListWorkspaces200Response>, Integer, Hash)> list_workspaces_with_http_info(opts)

```ruby
begin
  # List workspaces
  data, status_code, headers = api_instance.list_workspaces_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListWorkspaces200Response>
rescue Repull::ApiError => e
  puts "Error when calling WorkspacesApi->list_workspaces_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** |  | [optional][default to 25] |
| **cursor** | **String** | &#x60;pagination.nextCursor&#x60; from the previous page. | [optional] |
| **external_ref** | **String** | Only the workspace you tagged with this &#x60;externalRef&#x60; (your own id for the customer). | [optional] |

### Return type

[**ListWorkspaces200Response**](ListWorkspaces200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

