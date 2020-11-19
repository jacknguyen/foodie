module API
  class RestaurantsController < APIController
    before_action :find_or_create, only: [:like, :dislike]

    def search
      restaurants = Business.search(zip_code: params[:zip_code],
                                    page: params[:page],
                                    term: params[:term])

      options = {}
      options[:meta] = {
        page: params[:page]&.to_i || 1,
        total: restaurants.count
      }
      render json: RestaurantSerializer.new(restaurants, options)
        .serializable_hash.to_json
    end

    def like
      current_user.like(@restaurant)
      head :ok
    end

    def dislike
      current_user.dislike(@restaurant)
      head :ok
    end

    private

    def restaurant_params
      attrs = %i[name image_url rating url price review_count id]
      params.require(:restaurant).permit(attrs)
    end

    def find_or_create
      @restaurant = Restaurant.find_or_create_by(id: params[:id])
      @restaurant.update(restaurant_params)
    end
  end
end
