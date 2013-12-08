require './lib/citysourced/citysourced.rb'
class Report

	def initialize(attributes = {})
		@max_results = attributes[:max_results]
		@current_status = attributes[:current_status] || 'Submitted'
		@radius = attributes[:radius] || 5
	end

	def by_report_id(report_id, report_attributes = {})
		attributes = { 
			api_request_type: 'GetReport', 
			api_request_version: 1,
			report_id: report_id,
			include_details: report_attributes[:include_details],
			include_comments: report_attributes[:include_comments],
			include_votes: report_attributes[:include_votes]
		}
		Citysourced.new(attributes).get_report

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
