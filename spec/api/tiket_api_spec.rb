require 'spec_helper'
require 'json'

# tiket.com channel: the request on the wire and the decoded response (Typhoeus stubs, no network).
describe 'TiketApi' do
  let(:config) do
    Repull::Configuration.new.tap do |c|
      c.scheme = 'https'
      c.host = 'api.repull.dev'
      c.access_token = 'sk_test'
    end
  end
  let(:api) { Repull::TiketApi.new(Repull::ApiClient.new(config)) }

  after { Typhoeus::Expectation.clear }

  it 'lists tiket.com reservations with filters and decodes rows' do
    sent = nil
    Typhoeus.stub(%r{/v1/channels/tiket/reservations}) do |req|
      sent = req
      Typhoeus::Response.new(code: 200, headers: { 'Content-Type' => 'application/json' },
                             body: { data: [{ reservationId: '42', tiketReservationId: 'T1', paymentMethod: 'Bank Transfer', status: 'confirmed' }],
                                     pagination: { limit: 50, offset: 0, hasMore: false } }.to_json)
    end

    res = api.list_tiket_reservations(property_id: '123', status: 'confirmed')

    expect(sent.options[:method]).to eq(:get)
    expect(sent.options[:params]).to include(property_id: '123', status: 'confirmed')
    expect(res).to be_a(Repull::TiketReservationListResponse)
    expect(res.data.first.reservation_id).to eq('42')
    expect(res.data.first.payment_method).to eq('Bank Transfer')
  end

  it 'sends a rates write and decodes the read-back result' do
    sent = nil
    Typhoeus.stub(%r{/v1/channels/tiket/availability}) do |req|
      sent = req
      Typhoeus::Response.new(code: 200, headers: { 'Content-Type' => 'application/json' },
                             body: { propertyId: '123', type: 'rates', updates: 1, requests: 1, echoTokens: ['e1'], warnings: [], applied: 'verified' }.to_json)
    end

    body = Repull::TiketAvailabilityUpdateRequest.new(
      property_id: '123', type: 'rates',
      updates: [Repull::TiketAriUpdate.new(room_type_code: 'R1', rate_plan_code: 'P1', start: Date.new(2026, 12, 1), _end: Date.new(2026, 12, 2), price: 25_000_000.0)]
    )
    res = api.update_tiket_availability(body)

    expect(sent.options[:method]).to eq(:put)
    payload = JSON.parse(sent.options[:body])
    expect(payload['property_id']).to eq('123')
    expect(payload['updates'].first).to include('roomTypeCode' => 'R1', 'start' => '2026-12-01', 'end' => '2026-12-02', 'price' => 25_000_000.0)
    expect(res).to be_a(Repull::TiketAriWriteResponse)
    expect(res.applied).to eq('verified')
  end
end
