require 'rails_helper'

RSpec.describe "taxonomies/index", type: :view do
  before(:each) do
    assign(:taxonomies, [
      Taxonomy.create!(),
      Taxonomy.create!()
    ])
  end

  it "renders a list of taxonomies" do
    render
  end
end
