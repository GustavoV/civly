require 'test_helper'

class ProfPicsControllerTest < ActionController::TestCase
  setup do
    @prof_pic = prof_pics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prof_pics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prof_pic" do
    assert_difference('ProfPic.count') do
      post :create, prof_pic: { description: @prof_pic.description, name: @prof_pic.name, picture: @prof_pic.picture }
    end

    assert_redirected_to prof_pic_path(assigns(:prof_pic))
  end

  test "should show prof_pic" do
    get :show, id: @prof_pic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prof_pic
    assert_response :success
  end

  test "should update prof_pic" do
    patch :update, id: @prof_pic, prof_pic: { description: @prof_pic.description, name: @prof_pic.name, picture: @prof_pic.picture }
    assert_redirected_to prof_pic_path(assigns(:prof_pic))
  end

  test "should destroy prof_pic" do
    assert_difference('ProfPic.count', -1) do
      delete :destroy, id: @prof_pic
    end

    assert_redirected_to prof_pics_path
  end
end
