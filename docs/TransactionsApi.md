# Repull::TransactionsApi

All URIs are relative to *https://api.repull.dev*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_transaction_statement**](TransactionsApi.md#get_transaction_statement) | **GET** /v1/transactions/{id}/statement | Download the original payout statement |
| [**list_transactions**](TransactionsApi.md#list_transactions) | **GET** /v1/transactions | List transactions &amp; payments (unified ledger) |


## get_transaction_statement

> File get_transaction_statement(id, opts)

Download the original payout statement

Downloads the channel's ORIGINAL payout statement — the authoritative settlement record a host reconciles against — for a payout transaction. `{id}` is the payout `transactionId` (e.g. `booking_payout_5463377687_bank_transfer`). Repull serves the stored bytes itself (no channel session), so unlike the channel's own link it never expires or leaks a session. PDF by default; pass `?format=csv` for the CSV remittance. Returns `404` when no statement was captured for the payout (e.g. an upcoming payout, or a channel that has none).

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TransactionsApi.new
id = 'id_example' # String | The payout transaction id (`transactionId`).
opts = {
  x_schema: 'my-app-schema', # String | Apply a custom or built-in schema to transform the response. Built-in: `native` (default), `calry`, `calry-v1`. Custom: any schema name created via `POST /v1/schema/custom`. Unknown / inactive schema names fall back to `native`.
  format: 'pdf' # String | Statement format.
}

begin
  # Download the original payout statement
  result = api_instance.get_transaction_statement(id, opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TransactionsApi->get_transaction_statement: #{e}"
end
```

#### Using the get_transaction_statement_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(File, Integer, Hash)> get_transaction_statement_with_http_info(id, opts)

```ruby
begin
  # Download the original payout statement
  data, status_code, headers = api_instance.get_transaction_statement_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue Repull::ApiError => e
  puts "Error when calling TransactionsApi->get_transaction_statement_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The payout transaction id (&#x60;transactionId&#x60;). |  |
| **x_schema** | **String** | Apply a custom or built-in schema to transform the response. Built-in: &#x60;native&#x60; (default), &#x60;calry&#x60;, &#x60;calry-v1&#x60;. Custom: any schema name created via &#x60;POST /v1/schema/custom&#x60;. Unknown / inactive schema names fall back to &#x60;native&#x60;. | [optional] |
| **format** | **String** | Statement format. | [optional][default to &#39;pdf&#39;] |

### Return type

**File**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/pdf, text/csv, application/json


## list_transactions

> <ListBookingTransactions200Response> list_transactions(opts)

List transactions & payments (unified ledger)

Every channel's money in one ledger: payouts that reached the host, reservation charges, refunds and adjustments, across Airbnb, Booking.com and Vrbo. Each row carries a normalized `platform` — `booking` always means Booking.com however the account was connected (official API or extranet); there is no `booking_extranet`, and `?platform=booking` matches all of them. A payout row's `amount` is the net the host received; `grossAmount` is what the guest paid and `fees` the deductions (commission, payments service fee, processing fee). Cursor-paginated, newest first.

### Examples

```ruby
require 'time'
require 'repull'
# setup authorization
Repull.configure do |config|
  # Configure Bearer authorization (API Key): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Repull::TransactionsApi.new
opts = {
  platform: 'airbnb', # String | Filter to one channel: `airbnb`, `booking` (Booking.com, however connected), or `vrbo`. Omit for all channels.
  type: 'type_example', # String | Filter by transaction type, e.g. `Payout`, `Reservation`, `Refund`.
  status: 'status_example', # String | Filter by raw status.
  is_payout: true, # Boolean | When `true`, only payout rows (money that reached the host).
  limit: 56, # Integer | Page size (default 100, max 500).
  cursor: 'cursor_example' # String | Opaque pagination cursor from a previous `pagination.nextCursor`.
}

begin
  # List transactions & payments (unified ledger)
  result = api_instance.list_transactions(opts)
  p result
rescue Repull::ApiError => e
  puts "Error when calling TransactionsApi->list_transactions: #{e}"
end
```

#### Using the list_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListBookingTransactions200Response>, Integer, Hash)> list_transactions_with_http_info(opts)

```ruby
begin
  # List transactions & payments (unified ledger)
  data, status_code, headers = api_instance.list_transactions_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListBookingTransactions200Response>
rescue Repull::ApiError => e
  puts "Error when calling TransactionsApi->list_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **platform** | **String** | Filter to one channel: &#x60;airbnb&#x60;, &#x60;booking&#x60; (Booking.com, however connected), or &#x60;vrbo&#x60;. Omit for all channels. | [optional] |
| **type** | **String** | Filter by transaction type, e.g. &#x60;Payout&#x60;, &#x60;Reservation&#x60;, &#x60;Refund&#x60;. | [optional] |
| **status** | **String** | Filter by raw status. | [optional] |
| **is_payout** | **Boolean** | When &#x60;true&#x60;, only payout rows (money that reached the host). | [optional] |
| **limit** | **Integer** | Page size (default 100, max 500). | [optional] |
| **cursor** | **String** | Opaque pagination cursor from a previous &#x60;pagination.nextCursor&#x60;. | [optional] |

### Return type

[**ListBookingTransactions200Response**](ListBookingTransactions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

