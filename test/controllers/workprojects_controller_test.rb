require 'test_helper'

class WorkprojectsControllerTest < ActionController::TestCase
  setup do
    @workproject = workprojects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workprojects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workproject" do
    assert_difference('Workproject.count') do
      post :create, workproject: { details: @workproject.details, expected_completion_date: @workproject.expected_completion_date, tenant_id: @workproject.tenant_id, title: @workproject.title }
    end

    assert_redirected_to workproject_path(assigns(:workproject))
  end

  test "should show workproject" do
    get :show, id: @workproject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workproject
    assert_response :success
  end

  test "should update workproject" do
    patch :update, id: @workproject, workproject: { details: @workproject.details, expected_completion_date: @workproject.expected_completion_date, tenant_id: @workproject.tenant_id, title: @workproject.title }
    assert_redirected_to workproject_path(assigns(:workproject))
  end

  test "should destroy workproject" do
    assert_difference('Workproject.count', -1) do
      delete :destroy, id: @workproject
    end

    assert_redirected_to workprojects_path
  end
end
