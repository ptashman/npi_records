require 'rails_helper'

RSpec.describe "npi_records/index", type: :view do
  before(:each) do
    assign(:npi_records, [
      NpiRecord.create!(),
      NpiRecord.create!()
    ])
  end

  it "renders a list of npi_records" do
    render
  end
end
