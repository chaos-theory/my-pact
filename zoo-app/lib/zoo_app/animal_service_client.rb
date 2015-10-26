require 'httparty'
require 'zoo_app/models/alligator'

class AnimalServiceClient
	include HTTParty
	base_uri 'http://animal-service.com'

	def get_alligator
		name = JSON.parse(self.class.get("/alligator").body)['name']
		Alligator.new(name)
	end
end