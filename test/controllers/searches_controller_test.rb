require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search_payroll" do
    get searches_search_payroll_url
    assert_response :success
  end

end
