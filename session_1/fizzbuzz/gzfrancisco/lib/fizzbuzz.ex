defmodule Fizzbuzz do
  # El caso mas complicado es el que va primero
  def fizz_buzz2(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: "fizzbuzz"
  def fizz_buzz2(n) when rem(n, 3) == 0, do: "fizz"
  def fizz_buzz2(n) when rem(n, 5) == 0, do: "buzz"
  def fizz_buzz2(n), do: n
  
  def fizz_buzz(n) do
    rem_3 = rem(n, 3)
    rem_5 = rem(n, 5)
    result_3 = case rem_3 do
      0 -> "fizz"
      _ -> ""
    end
    result_5 = case rem_5 do
      0 -> "buzz"
      _ -> ""
    end

    # concatenacion de binarios
    result = result_3 <> result_5

    case String.length(result) do
      0 -> n
      _ -> result
    end
  end
end
