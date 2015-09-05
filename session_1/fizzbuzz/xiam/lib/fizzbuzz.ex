defmodule Fizzbuzz do
  def fizzbuzz(n) when is_number(n) do
    {r3, r5} = {rem(n, 3), rem(n, 5)}
    case {r3, r5} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> n
    end
  end
end
