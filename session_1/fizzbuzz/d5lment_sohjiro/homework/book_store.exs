defmodule Bookstore do

  def calculate_total(taxes, orders = [_head | _tail]) do
    calculate_total_amount([], Enum.into(taxes, %{}), orders)
  end

  defp calculate_total_amount(data, %{NC: tax} = taxes , [ head = [id: _id, ship_to: :NC, net_amount: amount] | tail]) do
    [[head | [total: amount * (tax + 1)]] | data]
    |> calculate_total_amount(taxes, tail)
  end

  defp calculate_total_amount(data, %{TX: tax} = taxes, [ head = [id: _id, ship_to: :TX, net_amount: amount] | tail]) do
    [[head | [total: amount * (tax + 1)]] | data]
    |> calculate_total_amount(taxes, tail)
  end

  defp calculate_total_amount(data, taxes = %{}, [ head = [id: _id, ship_to: _ship_to, net_amount: amount] | tail]) do
    [[head | [total: amount]] | data]
    |> calculate_total_amount(taxes, tail)
  end

  defp calculate_total_amount(data, _, []) do
    data
    |> Enum.reverse
  end

end
