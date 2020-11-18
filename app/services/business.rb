class Business
  class InvalidArguments < StandardError
    def initialize(msg = 'Requires :zip_code or :address for searching')
      super(msg)
    end
  end

  class << self
    def client
      Yelp::Fusion.client
    end

    def limit
      20
    end
    # Searches for restaurants base on address or zipcode. Default search is set
    # to restaurants or else you'd get other non food places.
    #
    # Returns a collection of businesses
    #
    # ==== Examples
    #   Business.search(zip_code: 90210)
    #   Business.search(zip_code: 90210, page: 2)

    def search(opts = {})
      params = {
        categories: 'restaurants',
        limit: limit
      }.merge!(opts.except(:zip_code, :address, :page))
      location = opts[:zip_code] || opts[:address] || nil
      raise InvalidArguments unless location

      params.merge!(offset(opts[:page]))
      # Yelp::Fusion
      # coordinates = { latitude: 37.7577, longitude: -122.4376 }
      # params = {
      #   term: 'food',
      #   limit: 3,
      #   category_filter: 'discgolf'
      # }
      # client.search('San Francisco', params)
      # client.search('San Francisco', term: 'restaurants')
      # client.search('90094')
      restaurants = client.search(location, params)
    rescue Yelp::Fusion::Error::ValidationError
      []
    else
      restaurants&.businesses
    end

    private

    # Handles pagination from Yelp Fusion API.
    # Returns an offset amount determined by page number argument
    def offset(page_num)
      page = page_num&.to_i
      return {} unless page && page > 1

      offset_amt = (page - 1) * limit
      { offset: offset_amt }
    end
  end
end
