class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :likes, class_name: 'Restaurant', inverse_of: :liked
  has_and_belongs_to_many :dislikes, class_name: 'Restaurant', inverse_of: :disliked

  def like(restaurant)
    likes << restaurant unless like_ids.include? restaurant.id
  end

  def dislike(restaurant)
    dislikes << restaurant unless dislike_ids.include? restaurant.id
  end
end
