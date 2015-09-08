defmodule FizzbuzzTest do
  use ExUnit.Case
  import Fizzbuzz

  @maxTestN 1000

  test "When 1 then 1" do
    assert fizzbuzz(1) == 1
  end
  
  test "When 3 then Fizz" do
    assert fizzbuzz(3) == "Fizz"
  end
  
  test "When 5 then Buzz" do
    assert fizzbuzz(5) == "Buzz"
  end
  
  test "When must Fizz" do
    1..@maxTestN
      |> Enum.all? &(String.contains? fizzbuzz(&1 * 3), "Fizz")
      |> assert
  end
  
  test "When must Buzz" do
    1..@maxTestN
      |> Enum.all? &(String.contains? fizzbuzz(&1 * 5), "Buzz")
      |> assert
  end
  
  test "When must FizzBuzz" do
    1..@maxTestN
      |> Enum.all? &(fizzbuzz(&1 * 3 * 5) == "FizzBuzz")
      |> assert
  end
  
  test "When must not Fizz nor Buzz nor nuttin'" do
    1..@maxTestN
      |> Enum.filter(&(not divisible?(&1, 3) and not divisible?(&1, 5)))
      |> Enum.all? &(fizzbuzz(&1) == &1)
      |> assert
  end
  
end
