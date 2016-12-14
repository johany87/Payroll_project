require 'test_helper'

class ConceptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get concepts_index_url
    assert_response :success
  end

  test "should get new" do
    get concepts_new_url
    assert_response :success
  end

  test "should get create" do
    get concepts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get concepts_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get concepts_edit_url
    assert_response :success
  end

  test "should get update" do
    get concepts_update_url
    assert_response :success
  end

  test "should get show" do
    get concepts_show_url
    assert_response :success
  end

  test "should get find_concept" do
    get concepts_find_concept_url
    assert_response :success
  end

  test "should get concept_params" do
    get concepts_concept_params_url
    assert_response :success
  end

end
