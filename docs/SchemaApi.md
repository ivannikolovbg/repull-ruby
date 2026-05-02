# Repull::SchemaApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_custom_schema**](SchemaApi.md#create_custom_schema) | **POST** /v1/schema/custom | Create a custom schema |
| [**delete_custom_schema**](SchemaApi.md#delete_custom_schema) | **DELETE** /v1/schema/custom/{id} | Delete a custom schema |
| [**get_custom_schema**](SchemaApi.md#get_custom_schema) | **GET** /v1/schema/custom/{id} | Get a custom schema |
| [**list_custom_schemas**](SchemaApi.md#list_custom_schemas) | **GET** /v1/schema/custom | List custom schemas |
| [**update_custom_schema**](SchemaApi.md#update_custom_schema) | **PATCH** /v1/schema/custom/{id} | Update a custom schema |


## create_custom_schema

> <CustomSchemaCreateResponse> create_custom_schema(custom_schema_create)

Create a custom schema

Create a workspace-scoped field-mapping schema. The schema reshapes the `native` response payload into your app's preferred field names. After creation, set `X-Schema: <name>` on any read endpoint to apply it.  **Reserved names:** `calry`, `calry-v1`, `native` are built-in schemas and cannot be used as a custom name.  **Mapping safety:** Each mapping value is parsed by an internal expression engine — `eval`, `Function`, `process`, and other unsafe keywords are rejected up front. Field names are capped at 100 chars and expressions at 500 chars.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::SchemaApi.new
custom_schema_create = Repull::CustomSchemaCreate.new({name: 'my-app-schema', mappings: { key: 'inner_example'}}) # CustomSchemaCreate | 

begin
  # Create a custom schema
  result = api_instance.create_custom_schema(custom_schema_create)
  p result
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->create_custom_schema: #{e}"
end
```

#### Using the create_custom_schema_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CustomSchemaCreateResponse>, Integer, Hash)> create_custom_schema_with_http_info(custom_schema_create)

```ruby
begin
  # Create a custom schema
  data, status_code, headers = api_instance.create_custom_schema_with_http_info(custom_schema_create)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CustomSchemaCreateResponse>
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->create_custom_schema_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **custom_schema_create** | [**CustomSchemaCreate**](CustomSchemaCreate.md) |  |  |

### Return type

[**CustomSchemaCreateResponse**](CustomSchemaCreateResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_custom_schema

> <CustomSchemaDeleteResponse> delete_custom_schema(id)

Delete a custom schema

Hard-delete a custom schema. Subsequent requests carrying its name in `X-Schema` fall back to `native`. There is no undelete.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::SchemaApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Delete a custom schema
  result = api_instance.delete_custom_schema(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->delete_custom_schema: #{e}"
end
```

#### Using the delete_custom_schema_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CustomSchemaDeleteResponse>, Integer, Hash)> delete_custom_schema_with_http_info(id)

```ruby
begin
  # Delete a custom schema
  data, status_code, headers = api_instance.delete_custom_schema_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CustomSchemaDeleteResponse>
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->delete_custom_schema_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**CustomSchemaDeleteResponse**](CustomSchemaDeleteResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_custom_schema

> <CustomSchema> get_custom_schema(id)

Get a custom schema

Fetch a single custom schema by id. Scoped to the authenticated workspace — schemas that belong to other workspaces return 404.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::SchemaApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Custom schema id.

begin
  # Get a custom schema
  result = api_instance.get_custom_schema(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->get_custom_schema: #{e}"
end
```

#### Using the get_custom_schema_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CustomSchema>, Integer, Hash)> get_custom_schema_with_http_info(id)

```ruby
begin
  # Get a custom schema
  data, status_code, headers = api_instance.get_custom_schema_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CustomSchema>
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->get_custom_schema_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Custom schema id. |  |

### Return type

[**CustomSchema**](CustomSchema.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_custom_schemas

> <CustomSchemaListResponse> list_custom_schemas

List custom schemas

Returns every custom schema owned by the workspace, including inactive ones.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::SchemaApi.new

begin
  # List custom schemas
  result = api_instance.list_custom_schemas
  p result
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->list_custom_schemas: #{e}"
end
```

#### Using the list_custom_schemas_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CustomSchemaListResponse>, Integer, Hash)> list_custom_schemas_with_http_info

```ruby
begin
  # List custom schemas
  data, status_code, headers = api_instance.list_custom_schemas_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CustomSchemaListResponse>
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->list_custom_schemas_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**CustomSchemaListResponse**](CustomSchemaListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_custom_schema

> <CustomSchema> update_custom_schema(id, custom_schema_update)

Update a custom schema

Patch the description, mappings, or active flag of a custom schema. The schema `name` is immutable — create a new schema and migrate consumers if you need to rename. Mapping updates are revalidated for safety.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::SchemaApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
custom_schema_update = Repull::CustomSchemaUpdate.new # CustomSchemaUpdate | 

begin
  # Update a custom schema
  result = api_instance.update_custom_schema(id, custom_schema_update)
  p result
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->update_custom_schema: #{e}"
end
```

#### Using the update_custom_schema_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CustomSchema>, Integer, Hash)> update_custom_schema_with_http_info(id, custom_schema_update)

```ruby
begin
  # Update a custom schema
  data, status_code, headers = api_instance.update_custom_schema_with_http_info(id, custom_schema_update)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CustomSchema>
rescue Repull::ApiError => e
  puts "Error when calling SchemaApi->update_custom_schema_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **custom_schema_update** | [**CustomSchemaUpdate**](CustomSchemaUpdate.md) |  |  |

### Return type

[**CustomSchema**](CustomSchema.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

