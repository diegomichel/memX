require 'test_helper'

class ListitemsControllerTest < ActionController::TestCase
  setup do
    @listitem = listitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listitem" do
    assert_difference('Listitem.count') do
      post :create, listitem: { list_id: @listitem.list_id, previous_item_id: @listitem.previous_item_id, text: @listitem.text }
    end

    assert_redirected_to listitem_path(assigns(:listitem))
  end

  test "should show listitem" do
    get :show, id: @listitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listitem
    assert_response :success
  end

  test "should update listitem" do
    patch :update, id: @listitem, listitem: { list_id: @listitem.list_id, previous_item_id: @listitem.previous_item_id, text: @listitem.text }
    assert_redirected_to listitem_path(assigns(:listitem))
  end

  test "should destroy listitem" do
    assert_difference('Listitem.count', -1) do
      delete :destroy, id: @listitem
    end

    assert_redirected_to listitems_path
  end
end
