defmodule Fizzbuzz do

  def fizzbuzz(x), do: fizzbuzz(rem(x, 3), rem(x, 5), x)
  

  defp fizzbuzz(0, 0, _), do: "fizzbuzz"
  defp fizzbuzz(0, _, _), do: "fizz"
  defp fizzbuzz(_, 0, _), do: "buzz"
  defp fizzbuzz(_, _, x), do: x

end
