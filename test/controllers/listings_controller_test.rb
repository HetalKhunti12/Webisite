require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, listing: { cotact_id: @listing.cotact_id, dateLevelExpires: @listing.dateLevelExpires, objectApproved: @listing.objectApproved, objectApproved: @listing.objectApproved, objectCountry: @listing.objectCountry, objectDescription1: @listing.objectDescription1, objectDescription2: @listing.objectDescription2, objectEnabled: @listing.objectEnabled, objectKeywords: @listing.objectKeywords, objectLocation1: @listing.objectLocation1, objectLocation2: @listing.objectLocation2, objectPricing: @listing.objectPricing, objectPrimaryCategoryID: @listing.objectPrimaryCategoryID, objectRootCategoryId: @listing.objectRootCategoryId, objectStatus: @listing.objectStatus, objectTitle: @listing.objectTitle, objectTypeID: @listing.objectTypeID }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should show listing" do
    get :show, id: @listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing
    assert_response :success
  end

  test "should update listing" do
    patch :update, id: @listing, listing: { cotact_id: @listing.cotact_id, dateLevelExpires: @listing.dateLevelExpires, objectApproved: @listing.objectApproved, objectApproved: @listing.objectApproved, objectCountry: @listing.objectCountry, objectDescription1: @listing.objectDescription1, objectDescription2: @listing.objectDescription2, objectEnabled: @listing.objectEnabled, objectKeywords: @listing.objectKeywords, objectLocation1: @listing.objectLocation1, objectLocation2: @listing.objectLocation2, objectPricing: @listing.objectPricing, objectPrimaryCategoryID: @listing.objectPrimaryCategoryID, objectRootCategoryId: @listing.objectRootCategoryId, objectStatus: @listing.objectStatus, objectTitle: @listing.objectTitle, objectTypeID: @listing.objectTypeID }
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing
    end

    assert_redirected_to listings_path
  end
end
