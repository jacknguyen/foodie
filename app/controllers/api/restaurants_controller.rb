module API
  class RestaurantsController < APIController
    def search
      restaurants = Business.search(zip_code: params[:zip_code],
                                    page: params[:page],
                                    term: params[:term])
      options = {}
      options[:meta] = {
        page: params[:page]&.to_i || 1,
        total: restaurants.count
      }
      render json: RestaurantSerializer.new(restaurants, options).serializable_hash.to_json
    end
  end
end
