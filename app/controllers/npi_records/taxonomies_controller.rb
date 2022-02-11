class NpiRecords::TaxonomiesController < ApplicationController
  before_action :set_npi_record

  def index
    @taxonomies = Taxonomy.where(npi_record_id: @npi_record.id)
  end

  private

  def set_npi_record
    @npi_record = NpiRecord.find_by(identifier: params[:npi_record_identifier])
  end
end