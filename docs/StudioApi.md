# Repull::StudioApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_studio_deployment**](StudioApi.md#create_studio_deployment) | **POST** /api/studio/deployments | Trigger a Studio deployment |
| [**create_studio_project**](StudioApi.md#create_studio_project) | **POST** /api/studio/projects | Create a Studio project |
| [**create_studio_project_generation**](StudioApi.md#create_studio_project_generation) | **POST** /api/studio/projects/{id}/generations | Run a Studio generation |
| [**delete_studio_deployment**](StudioApi.md#delete_studio_deployment) | **DELETE** /api/studio/deployments/{id} | Delete a Studio deployment |
| [**delete_studio_project**](StudioApi.md#delete_studio_project) | **DELETE** /api/studio/projects/{id} | Delete a Studio project |
| [**delete_studio_project_file**](StudioApi.md#delete_studio_project_file) | **DELETE** /api/studio/projects/{id}/files/{path} | Delete a Studio project file |
| [**generate_studio_completion**](StudioApi.md#generate_studio_completion) | **POST** /api/studio/generate | Generate text with Repull AI |
| [**get_studio_deployment**](StudioApi.md#get_studio_deployment) | **GET** /api/studio/deployments/{id} | Get a Studio deployment |
| [**get_studio_project**](StudioApi.md#get_studio_project) | **GET** /api/studio/projects/{id} | Get a Studio project |
| [**list_studio_deployments**](StudioApi.md#list_studio_deployments) | **GET** /api/studio/deployments | List Studio deployments |
| [**list_studio_project_files**](StudioApi.md#list_studio_project_files) | **GET** /api/studio/projects/{id}/files | List Studio project files |
| [**list_studio_projects**](StudioApi.md#list_studio_projects) | **GET** /api/studio/projects | List Studio projects |
| [**suspend_studio_deployment**](StudioApi.md#suspend_studio_deployment) | **POST** /api/studio/deployments/{id}/suspend | Suspend a Studio deployment |
| [**update_studio_project**](StudioApi.md#update_studio_project) | **PATCH** /api/studio/projects/{id} | Update a Studio project |
| [**upsert_studio_project_file**](StudioApi.md#upsert_studio_project_file) | **PUT** /api/studio/projects/{id}/files/{path} | Upsert a Studio project file |
| [**wake_studio_deployment**](StudioApi.md#wake_studio_deployment) | **POST** /api/studio/deployments/{id}/wake | Wake a suspended Studio deployment |


## create_studio_deployment

> <CreateStudioDeployment201Response> create_studio_deployment(create_studio_deployment_request)

Trigger a Studio deployment

Kicks off a new deployment for a project — Repull provisions a Fly.io machine, writes the subdomain DNS record, and builds the project. The response returns immediately with `provisioning` status; poll `GET /api/studio/deployments/{id}` until `live`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
create_studio_deployment_request = Repull::CreateStudioDeploymentRequest.new({project_id: 'project_id_example'}) # CreateStudioDeploymentRequest | 

begin
  # Trigger a Studio deployment
  result = api_instance.create_studio_deployment(create_studio_deployment_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->create_studio_deployment: #{e}"
end
```

#### Using the create_studio_deployment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateStudioDeployment201Response>, Integer, Hash)> create_studio_deployment_with_http_info(create_studio_deployment_request)

```ruby
begin
  # Trigger a Studio deployment
  data, status_code, headers = api_instance.create_studio_deployment_with_http_info(create_studio_deployment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateStudioDeployment201Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->create_studio_deployment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_studio_deployment_request** | [**CreateStudioDeploymentRequest**](CreateStudioDeploymentRequest.md) |  |  |

### Return type

[**CreateStudioDeployment201Response**](CreateStudioDeployment201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_studio_project

> <CreateStudioProject201Response> create_studio_project(create_studio_project_request)

Create a Studio project

Spins up a new Studio project from a name + prompt. Repull AI uses the prompt to materialize the initial template; the returned project starts in `draft` status.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
create_studio_project_request = Repull::CreateStudioProjectRequest.new({name: 'name_example', prompt: 'prompt_example'}) # CreateStudioProjectRequest | 

begin
  # Create a Studio project
  result = api_instance.create_studio_project(create_studio_project_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->create_studio_project: #{e}"
end
```

#### Using the create_studio_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateStudioProject201Response>, Integer, Hash)> create_studio_project_with_http_info(create_studio_project_request)

```ruby
begin
  # Create a Studio project
  data, status_code, headers = api_instance.create_studio_project_with_http_info(create_studio_project_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateStudioProject201Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->create_studio_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_studio_project_request** | [**CreateStudioProjectRequest**](CreateStudioProjectRequest.md) |  |  |

### Return type

[**CreateStudioProject201Response**](CreateStudioProject201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_studio_project_generation

> <CreateStudioProjectGeneration201Response> create_studio_project_generation(id, create_studio_project_generation_request)

Run a Studio generation

Records a generation run scoped to a single project — Repull AI takes the prompt, generates the response, and stores it on the project timeline. Use this when you want generation history; for one-shot completions without persistence use `POST /api/studio/generate`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
create_studio_project_generation_request = Repull::CreateStudioProjectGenerationRequest.new({prompt: 'prompt_example'}) # CreateStudioProjectGenerationRequest | 

begin
  # Run a Studio generation
  result = api_instance.create_studio_project_generation(id, create_studio_project_generation_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->create_studio_project_generation: #{e}"
end
```

#### Using the create_studio_project_generation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateStudioProjectGeneration201Response>, Integer, Hash)> create_studio_project_generation_with_http_info(id, create_studio_project_generation_request)

```ruby
begin
  # Run a Studio generation
  data, status_code, headers = api_instance.create_studio_project_generation_with_http_info(id, create_studio_project_generation_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateStudioProjectGeneration201Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->create_studio_project_generation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **create_studio_project_generation_request** | [**CreateStudioProjectGenerationRequest**](CreateStudioProjectGenerationRequest.md) |  |  |

### Return type

[**CreateStudioProjectGeneration201Response**](CreateStudioProjectGeneration201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_studio_deployment

> <DeleteStudioDeployment200Response> delete_studio_deployment(id)

Delete a Studio deployment

Tears down a deployment — releases the Fly.io machine, removes the DNS record, and marks the deployment as deleted. The underlying project is unaffected.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Delete a Studio deployment
  result = api_instance.delete_studio_deployment(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->delete_studio_deployment: #{e}"
end
```

#### Using the delete_studio_deployment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeleteStudioDeployment200Response>, Integer, Hash)> delete_studio_deployment_with_http_info(id)

```ruby
begin
  # Delete a Studio deployment
  data, status_code, headers = api_instance.delete_studio_deployment_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeleteStudioDeployment200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->delete_studio_deployment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**DeleteStudioDeployment200Response**](DeleteStudioDeployment200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_studio_project

> <DeleteStudioProject200Response> delete_studio_project(id)

Delete a Studio project

Soft-deletes a project. The project is archived and removed from the listing endpoint, but its files and deployments are retained for recovery.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Delete a Studio project
  result = api_instance.delete_studio_project(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->delete_studio_project: #{e}"
end
```

#### Using the delete_studio_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeleteStudioProject200Response>, Integer, Hash)> delete_studio_project_with_http_info(id)

```ruby
begin
  # Delete a Studio project
  data, status_code, headers = api_instance.delete_studio_project_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeleteStudioProject200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->delete_studio_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**DeleteStudioProject200Response**](DeleteStudioProject200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_studio_project_file

> <DeleteStudioProjectFile200Response> delete_studio_project_file(id, path)

Delete a Studio project file

Removes a single file from the project tree. The deployment is not redeployed automatically — trigger a new deployment to apply the change.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
path = 'path_example' # String | URL-encoded project-relative path.

begin
  # Delete a Studio project file
  result = api_instance.delete_studio_project_file(id, path)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->delete_studio_project_file: #{e}"
end
```

#### Using the delete_studio_project_file_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeleteStudioProjectFile200Response>, Integer, Hash)> delete_studio_project_file_with_http_info(id, path)

```ruby
begin
  # Delete a Studio project file
  data, status_code, headers = api_instance.delete_studio_project_file_with_http_info(id, path)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeleteStudioProjectFile200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->delete_studio_project_file_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **path** | **String** | URL-encoded project-relative path. |  |

### Return type

[**DeleteStudioProjectFile200Response**](DeleteStudioProjectFile200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## generate_studio_completion

> <GenerateStudioCompletion200Response> generate_studio_completion(generate_studio_completion_request)

Generate text with Repull AI

Sends a prompt to Repull AI and returns the completion synchronously. This is the single LLM endpoint used by the Studio UI; programmatic clients can use it to drive their own vibe-coding flows. Responses include token accounting, cost-in-micros, and cache/fallback flags. 429s include a `Retry-After` header.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
generate_studio_completion_request = Repull::GenerateStudioCompletionRequest.new({project_id: nil, prompt: 'prompt_example'}) # GenerateStudioCompletionRequest | 

begin
  # Generate text with Repull AI
  result = api_instance.generate_studio_completion(generate_studio_completion_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->generate_studio_completion: #{e}"
end
```

#### Using the generate_studio_completion_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateStudioCompletion200Response>, Integer, Hash)> generate_studio_completion_with_http_info(generate_studio_completion_request)

```ruby
begin
  # Generate text with Repull AI
  data, status_code, headers = api_instance.generate_studio_completion_with_http_info(generate_studio_completion_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateStudioCompletion200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->generate_studio_completion_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **generate_studio_completion_request** | [**GenerateStudioCompletionRequest**](GenerateStudioCompletionRequest.md) |  |  |

### Return type

[**GenerateStudioCompletion200Response**](GenerateStudioCompletion200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_studio_deployment

> <GetStudioDeployment200Response> get_studio_deployment(id)

Get a Studio deployment

Fetches a single deployment, including its current status and live URL. Poll this endpoint after `POST /api/studio/deployments` until `status` is `live`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Get a Studio deployment
  result = api_instance.get_studio_deployment(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->get_studio_deployment: #{e}"
end
```

#### Using the get_studio_deployment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStudioDeployment200Response>, Integer, Hash)> get_studio_deployment_with_http_info(id)

```ruby
begin
  # Get a Studio deployment
  data, status_code, headers = api_instance.get_studio_deployment_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStudioDeployment200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->get_studio_deployment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**GetStudioDeployment200Response**](GetStudioDeployment200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_studio_project

> <GetStudioProject200Response> get_studio_project(id)

Get a Studio project

Fetches a single Studio project by ID, including its current status and timestamps.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Project UUID.

begin
  # Get a Studio project
  result = api_instance.get_studio_project(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->get_studio_project: #{e}"
end
```

#### Using the get_studio_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStudioProject200Response>, Integer, Hash)> get_studio_project_with_http_info(id)

```ruby
begin
  # Get a Studio project
  data, status_code, headers = api_instance.get_studio_project_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStudioProject200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->get_studio_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Project UUID. |  |

### Return type

[**GetStudioProject200Response**](GetStudioProject200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_studio_deployments

> <ListStudioDeployments200Response> list_studio_deployments(opts)

List Studio deployments

Returns every deployment across all projects in your account, newest first. Filter by project with `project_id`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
opts = {
  project_id: '38400000-8cf0-11bd-b23e-10b96e4ef00d', # String | Optional — restrict the list to a single project.
  status: 'provisioning', # String | 
  limit: 56, # Integer | 
  offset: 56 # Integer | 
}

begin
  # List Studio deployments
  result = api_instance.list_studio_deployments(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->list_studio_deployments: #{e}"
end
```

#### Using the list_studio_deployments_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListStudioDeployments200Response>, Integer, Hash)> list_studio_deployments_with_http_info(opts)

```ruby
begin
  # List Studio deployments
  data, status_code, headers = api_instance.list_studio_deployments_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListStudioDeployments200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->list_studio_deployments_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_id** | **String** | Optional — restrict the list to a single project. | [optional] |
| **status** | **String** |  | [optional] |
| **limit** | **Integer** |  | [optional][default to 50] |
| **offset** | **Integer** |  | [optional][default to 0] |

### Return type

[**ListStudioDeployments200Response**](ListStudioDeployments200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_studio_project_files

> <ListStudioProjectFiles200Response> list_studio_project_files(id)

List Studio project files

Returns every file in the project tree with its content, sha256, and size. Use the digests to detect drift before writing.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # List Studio project files
  result = api_instance.list_studio_project_files(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->list_studio_project_files: #{e}"
end
```

#### Using the list_studio_project_files_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListStudioProjectFiles200Response>, Integer, Hash)> list_studio_project_files_with_http_info(id)

```ruby
begin
  # List Studio project files
  data, status_code, headers = api_instance.list_studio_project_files_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListStudioProjectFiles200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->list_studio_project_files_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**ListStudioProjectFiles200Response**](ListStudioProjectFiles200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_studio_projects

> <ListStudioProjects200Response> list_studio_projects

List Studio projects

Returns every Studio project owned by the authenticated account, excluding soft-deleted ones. Use this to populate a project picker or dashboard.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new

begin
  # List Studio projects
  result = api_instance.list_studio_projects
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->list_studio_projects: #{e}"
end
```

#### Using the list_studio_projects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListStudioProjects200Response>, Integer, Hash)> list_studio_projects_with_http_info

```ruby
begin
  # List Studio projects
  data, status_code, headers = api_instance.list_studio_projects_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListStudioProjects200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->list_studio_projects_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListStudioProjects200Response**](ListStudioProjects200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## suspend_studio_deployment

> <GetStudioDeployment200Response> suspend_studio_deployment(id)

Suspend a Studio deployment

Pauses a deployment without deleting it — the Fly.io machine is stopped and the URL returns 503 until the deployment is woken. Suspended deployments do not accrue runtime charges.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Suspend a Studio deployment
  result = api_instance.suspend_studio_deployment(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->suspend_studio_deployment: #{e}"
end
```

#### Using the suspend_studio_deployment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStudioDeployment200Response>, Integer, Hash)> suspend_studio_deployment_with_http_info(id)

```ruby
begin
  # Suspend a Studio deployment
  data, status_code, headers = api_instance.suspend_studio_deployment_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStudioDeployment200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->suspend_studio_deployment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**GetStudioDeployment200Response**](GetStudioDeployment200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_studio_project

> <GetStudioProject200Response> update_studio_project(id, update_studio_project_request)

Update a Studio project

Updates project metadata. Only the included fields are touched; omit a field to leave it unchanged.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
update_studio_project_request = Repull::UpdateStudioProjectRequest.new # UpdateStudioProjectRequest | 

begin
  # Update a Studio project
  result = api_instance.update_studio_project(id, update_studio_project_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->update_studio_project: #{e}"
end
```

#### Using the update_studio_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStudioProject200Response>, Integer, Hash)> update_studio_project_with_http_info(id, update_studio_project_request)

```ruby
begin
  # Update a Studio project
  data, status_code, headers = api_instance.update_studio_project_with_http_info(id, update_studio_project_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStudioProject200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->update_studio_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **update_studio_project_request** | [**UpdateStudioProjectRequest**](UpdateStudioProjectRequest.md) |  |  |

### Return type

[**GetStudioProject200Response**](GetStudioProject200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## upsert_studio_project_file

> <UpsertStudioProjectFile200Response> upsert_studio_project_file(id, path, upsert_studio_project_file_request)

Upsert a Studio project file

Creates or replaces a file at the given path. Returns the new sha256 so subsequent writes can use optimistic concurrency.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
path = 'path_example' # String | URL-encoded project-relative path, e.g. `src%2Fapp%2Fpage.tsx`.
upsert_studio_project_file_request = Repull::UpsertStudioProjectFileRequest.new({content: 'content_example'}) # UpsertStudioProjectFileRequest | 

begin
  # Upsert a Studio project file
  result = api_instance.upsert_studio_project_file(id, path, upsert_studio_project_file_request)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->upsert_studio_project_file: #{e}"
end
```

#### Using the upsert_studio_project_file_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpsertStudioProjectFile200Response>, Integer, Hash)> upsert_studio_project_file_with_http_info(id, path, upsert_studio_project_file_request)

```ruby
begin
  # Upsert a Studio project file
  data, status_code, headers = api_instance.upsert_studio_project_file_with_http_info(id, path, upsert_studio_project_file_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpsertStudioProjectFile200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->upsert_studio_project_file_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **path** | **String** | URL-encoded project-relative path, e.g. &#x60;src%2Fapp%2Fpage.tsx&#x60;. |  |
| **upsert_studio_project_file_request** | [**UpsertStudioProjectFileRequest**](UpsertStudioProjectFileRequest.md) |  |  |

### Return type

[**UpsertStudioProjectFile200Response**](UpsertStudioProjectFile200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## wake_studio_deployment

> <GetStudioDeployment200Response> wake_studio_deployment(id)

Wake a suspended Studio deployment

Resumes a previously suspended deployment — Repull restarts the Fly.io machine and the URL becomes reachable again once `status` returns to `live`.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::StudioApi.new
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Wake a suspended Studio deployment
  result = api_instance.wake_studio_deployment(id)
  p result
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->wake_studio_deployment: #{e}"
end
```

#### Using the wake_studio_deployment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStudioDeployment200Response>, Integer, Hash)> wake_studio_deployment_with_http_info(id)

```ruby
begin
  # Wake a suspended Studio deployment
  data, status_code, headers = api_instance.wake_studio_deployment_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStudioDeployment200Response>
rescue Repull::ApiError => e
  puts "Error when calling StudioApi->wake_studio_deployment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**GetStudioDeployment200Response**](GetStudioDeployment200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

