require 'rails_helper'

RSpec.describe "npi_records/edit", type: :view do
  before(:each) do
    @npi_record = assign(:npi_record, NpiRecord.create!())
  end

  it "renders the edit npi_record form" do
    render

    assert_select "form[action=?][method=?]", npi_record_path(@npi_record), "post" do
    end
  end
end
