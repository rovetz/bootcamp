require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = products(:one)
  end

  test 'product have name' do
    assert @product.respond_to? :name
    assert_not @product.update_attributes(name: nil)
  end

  test 'product have price' do
    assert @product.respond_to? :price
    assert_not @product.update_attributes(price_cents: nil)
  end

  test 'product have amount' do
    assert @product.respond_to? :amount
    assert_not @product.update_attributes(amount_cents: nil)
  end

  test 'product full price is amount + 10% tax' do
    assert_equal (@product.amount*1.1), @product.full_price
  end

  test 'method that retrieve all products inserted by month' do
    @product.update_attributes(created_at: Time.now-6.months)
    assert_equal Product.where(created_at: (Date.today.beginning_of_month..Date.today.end_of_month)).count, Product.inserted_by_month(Date.today).count
  end

end
