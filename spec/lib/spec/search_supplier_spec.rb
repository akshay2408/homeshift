require 'spec_helper'

describe SearchSupplier do
  it "Should return 'Supplier not found'" do
    search = SearchSupplier.new
    result = search.fetch_supplier("ABDC")

    expect(result).to eql('Supplier not found')
  end

  it "Should return 'Affinity is the supplier of the property.'" do
    search = SearchSupplier.new
    result = search.fetch_supplier("tw18 3at")

    expect(result).to eql('Affinity is the supplier of the property.')
  end

  it "Should return 'ThamesWater is the supplier of the property.'" do
    search = SearchSupplier.new
    result = search.fetch_supplier("EC2A 4BX")

    expect(result).to eql('ThamesWater is the supplier of the property.')
  end

end
