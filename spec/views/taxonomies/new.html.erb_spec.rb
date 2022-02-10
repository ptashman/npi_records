require 'rails_helper'

RSpec.describe "taxonomies/new", type: :view do
  before(:each) do
    assign(:taxonomy, Taxonomy.new())
  end

  it "renders new taxonomy form" do
    render

    assert_select "form[action=?][method=?]", taxonomies_path, "post" do
    end
  end
end
