require 'test_helper'

class EmployeesConceptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employees_concepts_index_url
    assert_response :success
  end

  test "should get new" do
    get employees_concepts_new_url
    assert_response :success
  end

  test "should get create" do
    get employees_concepts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get employees_concepts_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get employees_concepts_edit_url
    assert_response :success
  end

  test "should get update" do
    get employees_concepts_update_url
    assert_response :success
  end

  test "should get show" do
    get employees_concepts_show_url
    assert_response :success
  end

  test "should get find_employees_concepts" do
    get employees_concepts_find_employees_concepts_url
    assert_response :success
  end

  test "should get employee_concept_params" do
    get employees_concepts_employee_concept_params_url
    assert_response :success
  end

end
