# require "test_helper"

# class ProductOrdersControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @product_order = product_orders(:one)
#   end

#   test "should get index" do
#     get product_orders_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_product_order_url
#     assert_response :success
#   end

#   test "should create product_order" do
#     assert_difference('ProductOrder.count') do
#       post product_orders_url, params: { product_order: { amount: @product_order.amount, order_id: @product_order.order_id, product_id: @product_order.product_id, quantity: @product_order.quantity, spec_id: @product_order.spec_id } }
#     end

#     assert_redirected_to product_order_url(ProductOrder.last)
#   end

#   test "should show product_order" do
#     get product_order_url(@product_order)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_product_order_url(@product_order)
#     assert_response :success
#   end

#   test "should update product_order" do
#     patch product_order_url(@product_order), params: { product_order: { amount: @product_order.amount, order_id: @product_order.order_id, product_id: @product_order.product_id, quantity: @product_order.quantity, spec_id: @product_order.spec_id } }
#     assert_redirected_to product_order_url(@product_order)
#   end

#   test "should destroy product_order" do
#     assert_difference('ProductOrder.count', -1) do
#       delete product_order_url(@product_order)
#     end

#     assert_redirected_to product_orders_url
#   end
# end
