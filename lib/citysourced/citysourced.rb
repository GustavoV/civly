
class Citysourced
	BASE_URI = 'http://api.citysourced.com'

	def initialize(attributes = {})
		@api_key = ENV['CITYSOURCED_API_KEY'] || attributes[:api_key]
		@api_request_type = attributes[:api_request_type]
		@api_request_version = attributes[:api_request_version]
		@address = attributes[:address]
		@city = attributes[:city]
		@state = attributes[:state]
		@radius = attributes[:radius]
		@report_id = attributes[:report_id]
		@include_details = attributes[:include_details]
		@include_comments = attributes[:include_comments]
		@include_votes = attributes[:include_votes]
		@max_results = attributes[:max_results]
		@include_details = attributes[:include_details]
		@date_range_start = attributes[:date_range_start]
		@date_range_end = attributes[:date_range_end]
		@current_status = attributes[:current_status]
	end

	def to_hash
		raise NameError, "Cannot find request type: #{@api_request_type}" if @api_request_type.nil?
		hash = {
			ApiAuthKey: @api_key,
			ApiRequestType: @api_request_type,
			ApiRequestVersion: @api_request_version,
			Address: @address,
			City: @city,
			State: @state,
			Radius: @radius,
			ReportId: @report_id,

			MaxResults: @max_results,
			IncludeDetails: @include_details,
			DateRangeStart: @date_range_start,
			DateRangeEnd: @date_range_end,
			CurrentStatus: @current_status
		}
		hash
	end

	def to_xml
		self.to_hash.to_xml(root: 'CsRequest')
	end

	def get_reports
		parsed_response = HTTParty.post(
			"#{BASE_URI}/cs/rest/#{@api_request_type}.ashx?Output=json", body: "#{self.to_xml}"
		).parsed_response
		parsed_response.first[1]['Reports']['Report']
	end

	def get_report
		parsed_response = HTTParty.post(
			"#{BASE_URI}/cs/rest/#{@api_request_type}.ashx?Output=json", body: "#{self.to_xml}"
		).parsed_response
		parsed_response.first[1]['Report']
	end

end
