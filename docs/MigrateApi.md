# Repull::MigrateApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**check_migration_cutover**](MigrateApi.md#check_migration_cutover) | **POST** /v1/migrations/{workspaceId}/cutover-check | Check reservations before switching |
| [**cutover_migration**](MigrateApi.md#cutover_migration) | **POST** /v1/migrations/{workspaceId}/cutover | Cut over |
| [**delete_migration**](MigrateApi.md#delete_migration) | **DELETE** /v1/migrations/{workspaceId} | End a migration |
| [**get_migration**](MigrateApi.md#get_migration) | **GET** /v1/migrations/{workspaceId} | Get a migration |
| [**get_migration_channel_map**](MigrateApi.md#get_migration_channel_map) | **GET** /v1/migrations/{workspaceId}/channel-map | Get channel links |
| [**get_migration_report**](MigrateApi.md#get_migration_report) | **GET** /v1/migrations/{workspaceId}/report | Get a migration report |
| [**list_migrations**](MigrateApi.md#list_migrations) | **GET** /v1/migrations | List migrations |
| [**run_migration_import**](MigrateApi.md#run_migration_import) | **POST** /v1/migrations/{workspaceId}/import | Run the import again |


## check_migration_cutover

> <CheckMigrationCutover200Response> check_migration_cutover(workspace_id, check_migration_cutover_request)

Check reservations before switching

Send every upcoming reservation the destination holds; get back what is missing, extra, or on different dates compared with the source. Read-only — run it as often as you like before cutover.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MigrateApi.new
workspace_id = 56 # Integer | The migration's workspace id (from `POST /v1/connect` with `purpose: \"migrate\"`, or `GET /v1/migrations`).
check_migration_cutover_request = Repull::CheckMigrationCutoverRequest.new({reservations: [Repull::CheckMigrationCutoverRequestReservationsInner.new({confirmation_code: 'confirmation_code_example', check_in: Date.today, check_out: Date.today})]}) # CheckMigrationCutoverRequest | 

begin
  # Check reservations before switching
  result = api_instance.check_migration_cutover(workspace_id, check_migration_cutover_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->check_migration_cutover: #{e}"
end
```

#### Using the check_migration_cutover_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckMigrationCutover200Response>, Integer, Hash)> check_migration_cutover_with_http_info(workspace_id, check_migration_cutover_request)

```ruby
begin
  # Check reservations before switching
  data, status_code, headers = api_instance.check_migration_cutover_with_http_info(workspace_id, check_migration_cutover_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckMigrationCutover200Response>
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->check_migration_cutover_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** | The migration&#39;s workspace id (from &#x60;POST /v1/connect&#x60; with &#x60;purpose: \&quot;migrate\&quot;&#x60;, or &#x60;GET /v1/migrations&#x60;). |  |
| **check_migration_cutover_request** | [**CheckMigrationCutoverRequest**](CheckMigrationCutoverRequest.md) |  |  |

### Return type

[**CheckMigrationCutover200Response**](CheckMigrationCutover200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## cutover_migration

> <GetMigration200Response> cutover_migration(workspace_id)

Cut over

The property manager has switched: disconnect the source so it stops syncing. The imported data stays readable. Idempotent.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MigrateApi.new
workspace_id = 56 # Integer | The migration's workspace id (from `POST /v1/connect` with `purpose: \"migrate\"`, or `GET /v1/migrations`).

begin
  # Cut over
  result = api_instance.cutover_migration(workspace_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->cutover_migration: #{e}"
end
```

#### Using the cutover_migration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetMigration200Response>, Integer, Hash)> cutover_migration_with_http_info(workspace_id)

```ruby
begin
  # Cut over
  data, status_code, headers = api_instance.cutover_migration_with_http_info(workspace_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetMigration200Response>
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->cutover_migration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** | The migration&#39;s workspace id (from &#x60;POST /v1/connect&#x60; with &#x60;purpose: \&quot;migrate\&quot;&#x60;, or &#x60;GET /v1/migrations&#x60;). |  |

### Return type

[**GetMigration200Response**](GetMigration200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_migration

> <DeleteMigration200Response> delete_migration(workspace_id)

End a migration

Disconnects the source (it stops syncing) and deactivates the migration's workspace. The imported data is kept and stays readable.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MigrateApi.new
workspace_id = 56 # Integer | The migration's workspace id (from `POST /v1/connect` with `purpose: \"migrate\"`, or `GET /v1/migrations`).

begin
  # End a migration
  result = api_instance.delete_migration(workspace_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->delete_migration: #{e}"
end
```

#### Using the delete_migration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeleteMigration200Response>, Integer, Hash)> delete_migration_with_http_info(workspace_id)

```ruby
begin
  # End a migration
  data, status_code, headers = api_instance.delete_migration_with_http_info(workspace_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeleteMigration200Response>
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->delete_migration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** | The migration&#39;s workspace id (from &#x60;POST /v1/connect&#x60; with &#x60;purpose: \&quot;migrate\&quot;&#x60;, or &#x60;GET /v1/migrations&#x60;). |  |

### Return type

[**DeleteMigration200Response**](DeleteMigration200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_migration

> <GetMigration200Response> get_migration(workspace_id)

Get a migration

Where one migration stands: its state, the source connections with their last import run, and how much data has landed.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MigrateApi.new
workspace_id = 56 # Integer | The migration's workspace id (from `POST /v1/connect` with `purpose: \"migrate\"`, or `GET /v1/migrations`).

begin
  # Get a migration
  result = api_instance.get_migration(workspace_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->get_migration: #{e}"
end
```

#### Using the get_migration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetMigration200Response>, Integer, Hash)> get_migration_with_http_info(workspace_id)

```ruby
begin
  # Get a migration
  data, status_code, headers = api_instance.get_migration_with_http_info(workspace_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetMigration200Response>
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->get_migration_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** | The migration&#39;s workspace id (from &#x60;POST /v1/connect&#x60; with &#x60;purpose: \&quot;migrate\&quot;&#x60;, or &#x60;GET /v1/migrations&#x60;). |  |

### Return type

[**GetMigration200Response**](GetMigration200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_migration_channel_map

> <GetMigrationChannelMap200Response> get_migration_channel_map(workspace_id)

Get channel links

The Airbnb, Booking.com and VRBO listing each migrated property is linked to in the source PMS, read live. Use it to link each listing to the right property when the channels are reconnected in the destination — channel connections themselves cannot be moved between PMSs.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MigrateApi.new
workspace_id = 56 # Integer | The migration's workspace id (from `POST /v1/connect` with `purpose: \"migrate\"`, or `GET /v1/migrations`).

begin
  # Get channel links
  result = api_instance.get_migration_channel_map(workspace_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->get_migration_channel_map: #{e}"
end
```

#### Using the get_migration_channel_map_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetMigrationChannelMap200Response>, Integer, Hash)> get_migration_channel_map_with_http_info(workspace_id)

```ruby
begin
  # Get channel links
  data, status_code, headers = api_instance.get_migration_channel_map_with_http_info(workspace_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetMigrationChannelMap200Response>
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->get_migration_channel_map_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** | The migration&#39;s workspace id (from &#x60;POST /v1/connect&#x60; with &#x60;purpose: \&quot;migrate\&quot;&#x60;, or &#x60;GET /v1/migrations&#x60;). |  |

### Return type

[**GetMigrationChannelMap200Response**](GetMigrationChannelMap200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_migration_report

> <GetMigrationReport200Response> get_migration_report(workspace_id)

Get a migration report

What came across and what needs a decision in the destination: properties without an address, upcoming reservations with no guest contact, channel reservations that must not be re-created, and anything the source PMS cannot carry. Includes the source's capability matrix.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MigrateApi.new
workspace_id = 56 # Integer | The migration's workspace id (from `POST /v1/connect` with `purpose: \"migrate\"`, or `GET /v1/migrations`).

begin
  # Get a migration report
  result = api_instance.get_migration_report(workspace_id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->get_migration_report: #{e}"
end
```

#### Using the get_migration_report_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetMigrationReport200Response>, Integer, Hash)> get_migration_report_with_http_info(workspace_id)

```ruby
begin
  # Get a migration report
  data, status_code, headers = api_instance.get_migration_report_with_http_info(workspace_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetMigrationReport200Response>
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->get_migration_report_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** | The migration&#39;s workspace id (from &#x60;POST /v1/connect&#x60; with &#x60;purpose: \&quot;migrate\&quot;&#x60;, or &#x60;GET /v1/migrations&#x60;). |  |

### Return type

[**GetMigrationReport200Response**](GetMigrationReport200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_migrations

> <ListMigrations200Response> list_migrations(opts)

List migrations

Every property manager your workspace has moved through Repull Migrate, newest first, each with where it stands. Page with `pagination.nextCursor`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MigrateApi.new
opts = {
  limit: 56, # Integer | 
  cursor: 'cursor_example' # String | `pagination.nextCursor` from the previous page.
}

begin
  # List migrations
  result = api_instance.list_migrations(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->list_migrations: #{e}"
end
```

#### Using the list_migrations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListMigrations200Response>, Integer, Hash)> list_migrations_with_http_info(opts)

```ruby
begin
  # List migrations
  data, status_code, headers = api_instance.list_migrations_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListMigrations200Response>
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->list_migrations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** |  | [optional][default to 25] |
| **cursor** | **String** | &#x60;pagination.nextCursor&#x60; from the previous page. | [optional] |

### Return type

[**ListMigrations200Response**](ListMigrations200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## run_migration_import

> <RunMigrationImport202Response> run_migration_import(workspace_id, opts)

Run the import again

Queue another import from the source PMS — for example messages after the first pass, or only reservations changed since a date. Progress shows on `GET /v1/migrations/{workspaceId}`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::MigrateApi.new
workspace_id = 56 # Integer | The migration's workspace id (from `POST /v1/connect` with `purpose: \"migrate\"`, or `GET /v1/migrations`).
opts = {
  run_migration_import_request: Repull::RunMigrationImportRequest.new # RunMigrationImportRequest | 
}

begin
  # Run the import again
  result = api_instance.run_migration_import(workspace_id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->run_migration_import: #{e}"
end
```

#### Using the run_migration_import_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RunMigrationImport202Response>, Integer, Hash)> run_migration_import_with_http_info(workspace_id, opts)

```ruby
begin
  # Run the import again
  data, status_code, headers = api_instance.run_migration_import_with_http_info(workspace_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RunMigrationImport202Response>
rescue Repull::ApiError => e
  puts "Error when calling MigrateApi->run_migration_import_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workspace_id** | **Integer** | The migration&#39;s workspace id (from &#x60;POST /v1/connect&#x60; with &#x60;purpose: \&quot;migrate\&quot;&#x60;, or &#x60;GET /v1/migrations&#x60;). |  |
| **run_migration_import_request** | [**RunMigrationImportRequest**](RunMigrationImportRequest.md) |  | [optional] |

### Return type

[**RunMigrationImport202Response**](RunMigrationImport202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

