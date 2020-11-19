class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps

  field :yelp_id, type: String
  field :id, type: String, default: -> { yelp_id }
  field :name, type: String
  field :url, type: String
  field :image_url, type: String
  field :review_count, type: Integer
  field :price, type: String
  field :rating, type: Integer

  has_and_belongs_to_many :liked, class_name: 'User', inverse_of: :likes
  has_and_belongs_to_many :disliked, class_name: 'User', inverse_of: :dislikes
end
