require 'test_helper'

class GeneratorsControllerTest < ActionController::TestCase
  setup do
    @generator = generators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generator" do
    assert_difference('Generator.count') do
      post :create, generator: { author_id: @generator.author_id, is_private: @generator.is_private, name: @generator.name }
    end

    assert_redirected_to generator_path(assigns(:generator))
  end

  test "should show generator" do
    get :show, id: @generator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generator
    assert_response :success
  end

  test "should update generator" do
    patch :update, id: @generator, generator: { author_id: @generator.author_id, is_private: @generator.is_private, name: @generator.name }
    assert_redirected_to generator_path(assigns(:generator))
  end

  test "should destroy generator" do
    assert_difference('Generator.count', -1) do
      delete :destroy, id: @generator
    end

    assert_redirected_to generators_path
  end
end
