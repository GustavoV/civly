require './lib/citysourced/citysourced.rb'
class Report

	def initialize(attributes = {})
		@max_results = attributes[:max_results]
		@current_status = attributes[:current_status] || 'Submitted'
		@radius = attributes[:radius] || 5
	end

	def by_address(address)
		attributes = { 
			api_request_type: 'GetReportsByAddress', 
			api_request_version: 1,
			address: address,
			radius: @radius,
			current_status: @current_status,
			max_results: @max_results
		}
		Citysourced.new(attributes).get_reports
	end

	def by_city(city, state)
		attributes = { 
			api_request_type: 'GetReportsByCityState', 
			api_request_version: 1,
			city: city,
			state: state,
			radius: @radius,
			current_status: @current_status,
			max_results: @max_results
		}
		Citysourced.new(attributes).get_reports
	end
end
