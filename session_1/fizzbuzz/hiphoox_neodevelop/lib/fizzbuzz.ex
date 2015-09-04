defmodule Fizzbuzz do
  #def fizzbuzz(x), do: "fizzbuzz"
  def fizzbuzz(x) when is_number(x) do
    if rem(x,5) == 0 && rem(x,3) == 0 do
      "FizzBuzz"
    else if rem(x,5) == 0 do
        "Buzz"
    else if rem(x,3) == 0 do
          "Fizz"
        else
          x
        end
      end
    end
  end

  def fizzbuzz2(x) when is_number(x) do
    cond do
      rem(x,5) == 0 && rem(x,3) == 0 ->
        "FizzBuzz"
      rem(x,5) == 0 ->
        "Buzz"
      rem(x,3) == 0 ->
        "Fizz"
      true ->
        x
    end
  end

  def any( 0, 0,_c),  do: "FizzBuzz"
  def any(_a, 0,_c),  do: "Buzz"
  def any( 0,_b,_c),  do: "Fizz"
  def any(_a,_b, c),  do: c

  def fizzbuzz3(x) when is_number(x) do
    any(rem(x,3),rem(x,5),x)
  end

  def fizzbuzz4(x) when is_number(x) do
    another(rem(x,3),rem(x,5),x)
  end

  def another(a,b,c) do
    case {a,b,c} do
      {0,0,_} -> "FizzBuzz"
      {_,0,_} -> "Buzz"
      {0,_,_} -> "Fizz"
      {_,_,c} -> c
    end
  end

  def serie([head|tail]) do
    Enum.map [head|tail], fn(n) -> fizzbuzz(n) end
  end

  defp fizzbuzzDelCompa(x) when rem(x,5) and rem(x,3), do: "FizzBuzz"
  defp fizzbuzzDelCompa(x) when rem(x,5), do: "Buzz"
  defp fizzbuzzDelCompa(x) when rem(x,3), do: "Fizz"
  defp fizzbuzzDelCompa(x), do: x

end
