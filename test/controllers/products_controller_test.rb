require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "index should respond ok with list of products" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "create will redirect to index" do
    assert_difference('Product.count') do
      post :create, product: { amount: @product.amount, name: @product.name, price: @product.price }
    end

    assert_redirected_to products_path
  end

  test "update will redirect to index" do
    patch :update, id: @product, product: { amount: @product.amount, name: @product.name, price: @product.price }
    assert_redirected_to products_path
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
