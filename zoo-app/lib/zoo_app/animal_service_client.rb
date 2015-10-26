require 'httparty'

class AnimalServiceClient
	include HTTParty
	base_uri 'http://animal-service.com'

	def get_alligator
		# Yet to be implemented with Test First Development
	end
end