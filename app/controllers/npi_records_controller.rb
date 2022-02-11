class NpiRecordsController < ApplicationController
  def index
    @npi_records = NpiRecord.all.order('updated_at DESC')
  end

  def update_or_create
    begin
      NpiRecord.update_or_create_by_identifier!(npi_record_params[:identifier])
      flash[:notice] = "Success!"
      redirect_to npi_records_path
    rescue ActiveRecord::ActiveRecordError => e
      flash[:alert] = e.record.errors.full_messages
      redirect_to npi_records_path
    rescue NpiRegistryService::InvalidRequest
      flash[:alert] = 'There was an issue with your request.'
      redirect_to npi_records_path
    rescue NpiRegistryService::NoApiRecordDataError
      flash[:alert] = 'This record does not appear in the registry.'
      redirect_to npi_records_path
    rescue NpiRegistryService::ApiServerError
      flash[:alert] = 'There was an issue with the registry API. Please try again later.'
      redirect_to npi_records_path
    end
  end

  private

  def npi_record_params
    params.require(:npi_record).permit(:identifier)
  end
end
