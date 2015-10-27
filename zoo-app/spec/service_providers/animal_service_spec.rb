require_relative 'pact_helper'
require 'zoo_app/animal_service_client'

# When using RSpec, use the metadata `:pact => true` to include all the pact functionality in your spec.
# When using Minitest, include Pact::Consumer::Minitest in your spec.
describe AnimalServiceClient, :pact => true do

	before do
		# Configure your client to point to the stub service on localhost using the port you have specified
		AnimalServiceClient.base_uri 'localhost:1234'
	end

	subject { AnimalServiceClient.new }

	describe "get_alligator" do

		before do
			animal_service.given("an alligator exists").
			upon_receiving("a request for an alligator").
			with(method: :get, path: '/alligator', query: '').
			will_respond_with(
				status: 200,
				headers: {'Content-Type' => 'application/json'},
				body: {name: 'Mary'} )
		end

		it "returns an alligator" do
			expect(subject.get_alligator).to eq(Alligator.new('Mary'))
		end

	end

end