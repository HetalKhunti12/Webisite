require 'test_helper'

class ProfileVideosControllerTest < ActionController::TestCase
  setup do
    @profile_video = profile_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_video" do
    assert_difference('ProfileVideo.count') do
      post :create, profile_video: { artist_profilr_id: @profile_video.artist_profilr_id, description: @profile_video.description, title: @profile_video.title, video: @profile_video.video }
    end

    assert_redirected_to profile_video_path(assigns(:profile_video))
  end

  test "should show profile_video" do
    get :show, id: @profile_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_video
    assert_response :success
  end

  test "should update profile_video" do
    patch :update, id: @profile_video, profile_video: { artist_profilr_id: @profile_video.artist_profilr_id, description: @profile_video.description, title: @profile_video.title, video: @profile_video.video }
    assert_redirected_to profile_video_path(assigns(:profile_video))
  end

  test "should destroy profile_video" do
    assert_difference('ProfileVideo.count', -1) do
      delete :destroy, id: @profile_video
    end

    assert_redirected_to profile_videos_path
  end
end
