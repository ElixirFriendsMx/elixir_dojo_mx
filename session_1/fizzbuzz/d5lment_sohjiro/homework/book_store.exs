defmodule Bookstore do

  def calculate_total(taxes, orders = [_head | _tail]) do
    orders
    |> Enum.map(&(process_data(&1, taxes)))
  end

  def process_data(data, taxes) do
    taxes
    |> Enum.into(%{})
    |> get_tax_for(data[:ship_to])
    |> Enum.map(&calculate_tax(&1, data))
  end

  defp get_tax_for(%{NC: tax}, :NC), do: %{tax: tax + 1}
  defp get_tax_for(%{TX: tax}, :TX), do: %{tax: tax + 1}
  defp get_tax_for(_, _), do: %{tax: 1}

  defp calculate_tax({_, tax}, data) do
    data ++ [total: data[:net_amount] * tax]
  end

end
