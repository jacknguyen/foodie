require 'test_helper'

module BusinessTest
  class OffsetTest < ActiveSupport::TestCase
    test 'when the page number is 1' do
      assert({}, Business.send(:offset, '1'))
    end

    test 'when the page number is 2' do
      assert({ offset: Business.limit }, Business.send(:offset, '2'))
    end

    test 'when the page number is 5' do
      assert({ offset: Business.limit * 4 }, Business.send(:offset, '5'))
    end
  end

  class SearchTest < ActiveSupport::TestCase
    test "should get #{Business.limit} results" do
      assert Business.limit, Business.search(zip_code: 90094).count
    end

    test 'missing arguments' do
      assert_raises(Business::InvalidArguments) { Business.search }
    end

    test 'pagination' do
      assert Business.limit, Business.search(zip_code: 90094, page: 2).count
    end

    test 'api hitting results limit' do
      assert [], Business.search(zip_code: 90094, page: 1000)
    end
  end
end
