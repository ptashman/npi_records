require 'rails_helper'

RSpec.describe "npi_records/show", type: :view do
  before(:each) do
    @npi_record = assign(:npi_record, NpiRecord.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
