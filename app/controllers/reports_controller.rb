class ReportsController < ApplicationController

	def index
		report = Report.new(max_results: params[:max_results])
		if params[:query] == 'address'
			@reports = report.by_address
		elsif params[:query] == 'city'
			if params[:city].nil? || params[:state].nil?
				flash[:error] = 'Missing City or State in query'
			else
				@reports = report.by_city(params[:city], params[:state])
			end
		else
			@reports = report.by_city('Los Angeles', 'CA')
		end
	end

	def show
		report = Report.new
		@report = report.by_report_id(params[:id], include_details: 'True')
	end

end
