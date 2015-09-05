defmodule Fizzbuzz do
  def fizzbuzz(x) when rem(x,5) == 0 and rem(x,3)== 0, do: "fizzbuzz"
  def fizzbuzz(x) when rem(x,5) == 0, do: "buzz"
  def fizzbuzz(x) when rem(x,3) == 0, do: "fizz"
  def fizzbuzz(x), do: "#{inspect x}"
end
