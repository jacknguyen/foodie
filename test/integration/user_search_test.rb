require 'test_helper'

module UserSearchTest
  class VisitTest < ActionDispatch::IntegrationTest
    test 'can see page' do
      visit root_path
      assert page.has_content?('Foodie')
    end
  end

  class SearchTest < ActionDispatch::IntegrationTest
    setup do
      visit root_path
      fill_in('Zip Code', with: '90094')
      element = find('div.form-row:nth-child(1) > div:nth-child(1) > input:nth-child(2)')
      element.send_keys(:enter)
    end

    test 'can search by zip code and see results' do
      assert page.has_selector?('.card')
    end
  end
end
