defmodule Bookstore do

  def calculate_taxes_for_orders(tax_rates, orders) do
    Enum.map orders, fn(order) -> apply_tax_to(order, tax_rates) end
  end

  defp apply_tax_to([id,ship_to,net_amount], tax_rates) do
    #case {id, ship_to, net_amount} do
    #end
    case [id,ship_to,net_amount] do
      [_, {:ship_to, :NC},_] -> [id,ship_to,net_amount,{:total_amount, elem(net_amount,1) * 1.075}]
      [_, {:ship_to, :TX},_] -> [id,ship_to,net_amount,{:total_amount, elem(net_amount,1) * 1.080}]
      [_,_,_] -> [id,ship_to,net_amount,{:total_amount, elem(net_amount,1)}]
    end
  end

end
