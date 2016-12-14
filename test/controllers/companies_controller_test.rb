require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companies_index_url
    assert_response :success
  end

  test "should get new" do
    get companies_new_url
    assert_response :success
  end

  test "should get create" do
    get companies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get companies_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get companies_edit_url
    assert_response :success
  end

  test "should get update" do
    get companies_update_url
    assert_response :success
  end

  test "should get show" do
    get companies_show_url
    assert_response :success
  end

  test "should get find_company" do
    get companies_find_company_url
    assert_response :success
  end

  test "should get company_params" do
    get companies_company_params_url
    assert_response :success
  end

end
