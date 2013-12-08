
class Citysourced
	@base_uri = 'api.citysourced.com'

	def initialize(attributes = {})
		@api_key = attributes[:api_key]
		@api_request_type = attributes[:api_request_type]
		@api_request_version = attributes[:api_request_version]
		@address = attributes[:address]
		@radius = attributes[:radius]
		@max_results = attributes[:max_results]
		@include_details = attributes[:include_details]
		@date_range_start = attributes[:date_range_start]
		@date_range_end = attributes[:date_range_end]
		@current_status = attributes[:current_status]
	end

	def to_hash
		{
			ApiAuthKey: @api_key,
			ApiRequestType: @api_request_type,
			ApiRequestVersion: @api_request_version,
			Address: @address,
			Radius: @radius,
			MaxResults: @max_results,
			IncludeDetails: @include_details,
			DateRangeStart: @date_range_start,
			DateRangeEnd: @date_range_end,
			CurrentStatus: @current_status
		}
	end

	def to_xml
		self.to_hash.to_xml(root: 'CsRequest')
	end

	def get_graffiti_by_address
		HTTParty.post("http://api.citysourced.com/cs/rest/GetReportsByAddress.ashx?Output=json", body: "#{self.to_xml}")
	end

end
