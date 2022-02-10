require "rails_helper"

RSpec.describe NpiRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/npi_records").to route_to("npi_records#index")
    end

    it "routes to #new" do
      expect(get: "/npi_records/new").to route_to("npi_records#new")
    end

    it "routes to #show" do
      expect(get: "/npi_records/1").to route_to("npi_records#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/npi_records/1/edit").to route_to("npi_records#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/npi_records").to route_to("npi_records#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/npi_records/1").to route_to("npi_records#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/npi_records/1").to route_to("npi_records#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/npi_records/1").to route_to("npi_records#destroy", id: "1")
    end
  end
end
