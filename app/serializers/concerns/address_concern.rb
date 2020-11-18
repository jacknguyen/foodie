module AddressConcern
  extend ActiveSupport::Concern

  class_methods do
    def display_address(business)
      business.location.display_address
    end
  end
end
