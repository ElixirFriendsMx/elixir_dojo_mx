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
    assert Enum.map(1..@maxTestN, fn n -> String.contains? fizzbuzz(n * 3), "Fizz" end) == Enum.map(1..@maxTestN, fn _ -> true end)
  end
  
  test "When must Buzz" do
    assert Enum.map(1..@maxTestN, fn n -> String.contains? fizzbuzz(n * 5), "Buz" end) == Enum.map(1..@maxTestN, fn _ -> true end)
  end
  
  test "When must FizzBuzz" do
    assert Enum.map(1..@maxTestN, fn n -> fizzbuzz(n * 3 * 5) end) == Enum.map(1..@maxTestN, fn _ -> "FizzBuzz" end)
  end
  
  test "When must not Fizz nor Buzz nor nuttin'" do
    s = Enum.filter(1..@maxTestN, fn x -> rem(x,3) != 0 and rem(x,5) != 0 end)
    assert Enum.map(s, fn n -> fizzbuzz(n) end) == Enum.map(s, fn n -> n end)
  end
  
end
