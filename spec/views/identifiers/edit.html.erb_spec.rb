require 'rails_helper'

RSpec.describe "identifiers/edit", type: :view do
  before(:each) do
    @identifier = assign(:identifier, Identifier.create!())
  end

  it "renders the edit identifier form" do
    render

    assert_select "form[action=?][method=?]", identifier_path(@identifier), "post" do
    end
  end
end
