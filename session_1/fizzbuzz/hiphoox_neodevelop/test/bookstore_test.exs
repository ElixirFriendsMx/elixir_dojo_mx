defmodule BookstoreTest do
  use ExUnit.Case
  import Bookstore

  test "Get the tax for some orders in NC and TX" do
    # Given some tax rates
    tax_rates = [ NC: 0.075, TX: 0.08 ]
    # And some orderso
    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount:  50.00 ] ]
    # When we calculate taxes for those orders
    orders_with_taxes = calculate_taxes_for_orders(tax_rates, orders)
    assert orders_with_taxes == [
      [ id: 123, ship_to: :NC, net_amount: 100.00, total_amount: 107.50],
      [ id: 124, ship_to: :OK, net_amount:  35.50, total_amount: 35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00, total_amount: 25.92 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80, total_amount: 48.384],
      [ id: 127, ship_to: :NC, net_amount:  25.00, total_amount: 26.875],
      [ id: 128, ship_to: :MA, net_amount:  10.00, total_amount: 10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00, total_amount: 102.00],
      [ id: 120, ship_to: :NC, net_amount:  50.00, total_amount: 53.75 ] ]
  end
end
