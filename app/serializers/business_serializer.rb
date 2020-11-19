class BusinessSerializer
  include JSONAPI::Serializer
  # include AddressConcern

  attributes :name, :image_url, :id, :rating, :url, :price, :review_count

  # attribute :address do |business|
  #   display_address(business)
  # end
end
