require 'rails_helper'

RSpec.describe "taxonomies/show", type: :view do
  before(:each) do
    @taxonomy = assign(:taxonomy, Taxonomy.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
