require 'test_helper'

class Admin::SocialMediaLinksControllerTest < ActionController::TestCase
  setup do
    @admin_social_media_link = admin_social_media_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_social_media_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_social_media_link" do
    assert_difference('Admin::SocialMediaLink.count') do
      post :create, admin_social_media_link: { link: @admin_social_media_link.link, name: @admin_social_media_link.name }
    end

    assert_redirected_to admin_social_media_link_path(assigns(:admin_social_media_link))
  end

  test "should show admin_social_media_link" do
    get :show, id: @admin_social_media_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_social_media_link
    assert_response :success
  end

  test "should update admin_social_media_link" do
    patch :update, id: @admin_social_media_link, admin_social_media_link: { link: @admin_social_media_link.link, name: @admin_social_media_link.name }
    assert_redirected_to admin_social_media_link_path(assigns(:admin_social_media_link))
  end

  test "should destroy admin_social_media_link" do
    assert_difference('Admin::SocialMediaLink.count', -1) do
      delete :destroy, id: @admin_social_media_link
    end

    assert_redirected_to admin_social_media_links_path
  end
end
