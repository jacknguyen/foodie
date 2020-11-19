# Used during development
if Rails.env.development?
  restaurants = Business.search(zip_code: 90033)
  restaurants.each do |restaurant|
    puts "Adding #{restaurant.name}"
    Restaurant.create(
      yelp_id: restaurant.id,
      name: restaurant.name,
      url: restaurant.url,
      image_url: restaurant.image_url,
      review_count: restaurant.review_count,
      rating: restaurant.rating,
      price: restaurant.price
    )
  end
end
