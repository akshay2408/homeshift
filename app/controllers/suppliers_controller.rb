class SuppliersController < ApplicationController

  def search
    if request.post?
      @result = nil
      search = SearchSupplier.new
      if params["postcode"].present?
        @result = search.fetch_supplier(params["postcode"])
      else
        @result = 'Please insert valid postcode'
      end
    end
  end
end
