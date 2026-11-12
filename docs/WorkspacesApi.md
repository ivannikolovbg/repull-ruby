# Repull::WorkspacesApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**deactivate_workspace**](WorkspacesApi.md#deactivate_workspace) | **POST** /v1/workspaces/{workspaceId}/deactivate | Deactivate a workspace |
| [**list_workspaces**](WorkspacesApi.md#list_workspaces) | **GET** /v1/workspaces | List workspaces |
| [**reactivate_workspace**](WorkspacesApi.md#reactivate_workspace) | **POST** /v1/workspaces/{workspaceId}/reactivate | Reactivate a workspace |


## deactivate_workspace

> <DeactivateWorkspace200Response> deactivate_workspace(workspace_id)

Deactivate a workspace

Offboard one of your customers. Disconnects every account still connected in the sub-workspace (Airbnb hosts, Booking.com properties, Vrbo sign-ins, PMSs), deactivates its listings so they stop counting toward your plan, and marks the workspace inactive. Nothing is deleted: its listings, reservations and conversations are kept, and it stays in `GET /v1/workspaces` with `active: false` and `deactivatedAt`. Nothing is changed on the channels themselves. Calling it again is safe. Undo it with `POST /v1/workspaces/{workspaceId}/reactivate`. Workspace names don't have to be unique; the `workspaceId` (or your own `externalRef`) identifies a workspace.

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
workspace_id = 'workspace_id_example' # String | A `workspaceId` from `GET /v1/workspaces`.

begin
  # Deactivate a workspace
  result = api_instance.deactivate_workspace(workspace_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling WorkspacesApi->deactivate_workspace: #{e}"
end
```

#### Using the deactivate_workspace_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeactivateWorkspace200Response>, Integer, Hash)> deactivate_workspace_with_http_info(workspace_id)

```ruby
begin
  # Deactivate a workspace
  data, status_code, headers = api_instance.deactivate_workspace_with_http_info(workspace_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeactivateWorkspace200Response>
rescue Repull::ApiError => e
  puts "Error when calling WorkspacesApi->deactivate_workspace_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** | A &#x60;workspaceId&#x60; from &#x60;GET /v1/workspaces&#x60;. |  |

### Return type

[**DeactivateWorkspace200Response**](DeactivateWorkspace200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


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


## reactivate_workspace

> <ReactivateWorkspace200Response> reactivate_workspace(workspace_id)

Reactivate a workspace

Undo `POST /v1/workspaces/{workspaceId}/deactivate`. The workspace is active again and the listings the deactivation switched off are switched back on; listings that were already inactive before it stay inactive. Reactivated listings count toward your plan again, so a reactivation that would exceed your plan's listing cap is refused with `402 listings_limit_exceeded` and nothing changes. Accounts stay disconnected: have your customer reconnect each one through Connect (`POST /v1/connect` with `X-Workspace-Id` set to this workspace). Calling it on an active workspace changes nothing.

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
workspace_id = 'workspace_id_example' # String | A `workspaceId` from `GET /v1/workspaces`.

begin
  # Reactivate a workspace
  result = api_instance.reactivate_workspace(workspace_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling WorkspacesApi->reactivate_workspace: #{e}"
end
```

#### Using the reactivate_workspace_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReactivateWorkspace200Response>, Integer, Hash)> reactivate_workspace_with_http_info(workspace_id)

```ruby
begin
  # Reactivate a workspace
  data, status_code, headers = api_instance.reactivate_workspace_with_http_info(workspace_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReactivateWorkspace200Response>
rescue Repull::ApiError => e
  puts "Error when calling WorkspacesApi->reactivate_workspace_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **String** | A &#x60;workspaceId&#x60; from &#x60;GET /v1/workspaces&#x60;. |  |

### Return type

[**ReactivateWorkspace200Response**](ReactivateWorkspace200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

