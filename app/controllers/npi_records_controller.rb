class NpiRecordsController < ApplicationController
  def index
    @npi_records = NpiRecord.all
  end

  def update_or_create
    respond_to do |format|
      begin
        @npi_record = NpiRecord.update_or_create_by_identifier!(npi_record_params[:identifier])
        format.json { render status: 200, data: @npi_record }
      rescue ActiveRecord::ActiveRecordError => e
        format.json { render status: 422, message: e.record.errors.full_messages }
      rescue NpiRegistryService::InvalidRequest
        format.json { render status: 422, message: "There was an issue with your request." }
      rescue NpiRegistryService::NoApiRecordDataError
        format.json { render status: 404, message: "This record does not appear in the registry." }
      rescue NpiRegistryService::ApiServerError
        format.json { render status: 500, message: "There was an issue with the registry API. Please try again later." }
      end
    end
  end

  private

  def npi_record_params
    params.require(:npi_record).permit(:identifier)
  end
end
