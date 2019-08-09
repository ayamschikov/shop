# frozen_string_literal: true

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'creating orders for user' do
    # order = build(:order)
    order = create(:order)
    puts order.new_record?
    puts order.user.new_record?
    puts order.inspect
    # user = create(:user)
    # user_with_orders = build(:user_with_orders)

    # puts user.orders.inspect
    # puts user_with_orders.orders.inspect
  end

  # test "many to many" do
  #   order = create(:order)
  #   # puts order.user.inspect
  #   puts order.inspect
  # end
end
