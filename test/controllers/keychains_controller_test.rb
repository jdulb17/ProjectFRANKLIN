require 'test_helper'

class KeychainsControllerTest < ActionController::TestCase
  setup do
    @keychain = keychains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keychains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keychain" do
    assert_difference('Keychain.count') do
      post :create, keychain: { keyname: @keychain.keyname, keyval: @keychain.keyval }
    end

    assert_redirected_to keychain_path(assigns(:keychain))
  end

  test "should show keychain" do
    get :show, id: @keychain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keychain
    assert_response :success
  end

  test "should update keychain" do
    patch :update, id: @keychain, keychain: { keyname: @keychain.keyname, keyval: @keychain.keyval }
    assert_redirected_to keychain_path(assigns(:keychain))
  end

  test "should destroy keychain" do
    assert_difference('Keychain.count', -1) do
      delete :destroy, id: @keychain
    end

    assert_redirected_to keychains_path
  end
end
