require 'rails_helper'

RSpec.describe "npi_records/new", type: :view do
  before(:each) do
    assign(:npi_record, NpiRecord.new())
  end

  it "renders new npi_record form" do
    render

    assert_select "form[action=?][method=?]", npi_records_path, "post" do
    end
  end
end
