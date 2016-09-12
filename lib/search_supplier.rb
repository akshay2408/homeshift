class SearchSupplier

  # checks if address is for thames water supplier
  class ThamesWater
    attr_accessor :thame

    def initialize
      @thame = Mechanize.new
    end

    def verify(postcode)
      page = @thame.get('http://www.thameswater.co.uk/your-account/605.htm')
      search_form = page.forms.last
      search_form.postcode1 = postcode
      result_page = @thame.submit(search_form)
      result_page.content.include?("<h1>Your property is in our supply area</h1>") ? true : false
    end
  end

  # checks if address is for affinity supplier
  class Affinity
    attr_accessor :affinity

    def initialize
      @affinity = Mechanize.new
    end

    def verify(postcode)
      result_page = @affinity.get("https://www.affinitywater.co.uk/customer-zone.aspx?postcode=#{postcode}")
      result_page.content.include?("<p>The postcode you entered is not in our supply area.</p>") ? false : true
    end
  end


  def fetch_supplier(postcode)
    # search in thame water supplier
    thames = ThamesWater.new
    result = thames.verify(postcode)
    return 'ThamesWater is the supplier of the property.' if result
    
    # search in affinity supplier
    affinity = Affinity.new
    result = affinity.verify(postcode)
    return 'Affinity is the supplier of the property.' if result

    return 'Supplier not found'
  end

end