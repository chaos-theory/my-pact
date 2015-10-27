require 'httparty'
require 'zoo_app/models/alligator'

module ZooApp
	class AnimalServiceClient
		include HTTParty
		base_uri 'http://animal-service.com'

		def get_alligator
			name = JSON.parse(self.class.get("/alligator").body)['name']
			ZooApp::Animals::Alligator.new(name: name)
		end
	end
end