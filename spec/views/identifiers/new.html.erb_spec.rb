require 'rails_helper'

RSpec.describe "identifiers/new", type: :view do
  before(:each) do
    assign(:identifier, Identifier.new())
  end

  it "renders new identifier form" do
    render

    assert_select "form[action=?][method=?]", identifiers_path, "post" do
    end
  end
end
