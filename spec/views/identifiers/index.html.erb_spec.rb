require 'rails_helper'

RSpec.describe "identifiers/index", type: :view do
  before(:each) do
    assign(:identifiers, [
      Identifier.create!(),
      Identifier.create!()
    ])
  end

  it "renders a list of identifiers" do
    render
  end
end
