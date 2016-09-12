require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do

  describe "POST #supplier" do
    it "Should return 'Supplier not found' if postcode is not in supplier area" do
      post :search, { postcode: "R3w3SasdA" }
      expect(assigns(:result)).to eql('Supplier not found')
    end

    it "Should search supplier for Affinity post code" do
      post :search, { postcode: "tw18 3at" }
      expect(assigns(:result)).to eql('Affinity is the supplier of the property.')
    end

    it "Should search supplier for Thameswater post code" do
      post :search, { postcode: "EC2A 4BX" }
      expect(assigns(:result)).to eql('ThamesWater is the supplier of the property.')
    end

    it "Should return 'Please insert valid postcode' if postcode is nil" do
      post :search, { postcode: "" }
      expect(assigns(:result)).to eql('Please insert valid postcode')
    end
  end

end
