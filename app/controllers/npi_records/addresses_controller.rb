class NpiRecords::AddressesController < ApplicationController
  def index
    @addresses = Address.includes(:npi_record)
                        .where('npi_records': { identifier: params[:npi_record_identifier] })
  end
end
