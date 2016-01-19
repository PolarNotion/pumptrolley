require 'test_helper'

class SnippetsControllerTest < ActionController::TestCase
  setup do
    @snippet = snippets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snippets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snippet" do
    assert_difference('Snippet.count') do
      post :create, snippet: { author_id: @snippet.author_id, content: @snippet.content, documentation_url: @snippet.documentation_url, followup_content: @snippet.followup_content, is_private: @snippet.is_private, name: @snippet.name, parent_id: @snippet.parent_id, registration_url: @snippet.registration_url, tags: @snippet.tags }
    end

    assert_redirected_to snippet_path(assigns(:snippet))
  end

  test "should show snippet" do
    get :show, id: @snippet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @snippet
    assert_response :success
  end

  test "should update snippet" do
    patch :update, id: @snippet, snippet: { author_id: @snippet.author_id, content: @snippet.content, documentation_url: @snippet.documentation_url, followup_content: @snippet.followup_content, is_private: @snippet.is_private, name: @snippet.name, parent_id: @snippet.parent_id, registration_url: @snippet.registration_url, tags: @snippet.tags }
    assert_redirected_to snippet_path(assigns(:snippet))
  end

  test "should destroy snippet" do
    assert_difference('Snippet.count', -1) do
      delete :destroy, id: @snippet
    end

    assert_redirected_to snippets_path
  end
end
