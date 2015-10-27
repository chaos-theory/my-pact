require 'httparty'
require 'zoo_app/models/alligator'

module ZooApp
	class AnimalServiceClient
		include HTTParty
		base_uri 'animal-service.com'

		def self.find_alligator_by_name name
			response = get("/alligators/#{name}", :headers => {'Accept' => 'application/json'})
			when_successful(response) do
				ZooApp::Animals::Alligator.new(name: parse_body(response)['name'])
			end
		end

		def self.when_successful response
			if response.success?
				yield
			elsif response.code ==   404
				nil
			else
				raise response.body
			end
		end

		def self.parse_body response
			JSON.parse(response.body, {:symbolize_name => true})
		end
					

		def get_alligator
			name = JSON.parse(self.class.get("/alligator").body)['name']
			ZooApp::Animals::Alligator.new(name: name)
		end
	end
end