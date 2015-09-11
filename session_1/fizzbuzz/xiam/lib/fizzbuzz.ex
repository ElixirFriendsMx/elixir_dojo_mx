defmodule Fizzbuzz do
  @doc """
    Returns true if the given number (x) is divisible by the divisor (y).
  """
  def divisible?(x, y) when is_number(x) and is_number(y) do
    # A number is considered divisible by another number when it can be divided
    # by such number without a remainder.
    rem(x, y) == 0
  end

  @doc """
    Returns "FizzBuzz" when the given number (n) is divisible by both 3 and 5.
    Returns "Fizz" when the given number (n) is divisible by 3.
    Returns "Buzz" when the given number (n) is divisible by 5.
    Returns the number if none of the rules above is satisfied.
  """
  def fizzbuzz(n) when is_number(n) do
    case {divisible?(n, 3), divisible?(n, 5)} do
      {true, true} -> "FizzBuzz"
      {true,    _} -> "Fizz"
      {   _, true} -> "Buzz"
      {   _,    _} -> n
    end
  end
end
