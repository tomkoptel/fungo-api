require "spec_helper"

describe Fungo::API do
  describe "POS /api/v1/location" do
    let(:location) { {:location => {:latitude => "48.4532176", :longitude => "22.7034327", :mdt => "20121228_215345"}} }

    it "returns `success => true` for valid location" do
      post "/api/v1/location", location
      response.status.should == 201
      JSON.parse(response.body).should == {"success" => true}
    end

    [:latitude, :longitude, :mdt].each do |attr|
      it "returns `success => false` if location missing attr #{attr}" do
        location[:location][attr] = ""
        post "/api/v1/location", location
        response.status.should == 400
        JSON.parse(response.body).should == {"success" => false}
      end
    end
  end
end