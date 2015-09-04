defmodule FizzbuzzTest do
  use ExUnit.Case, async: true
  import Fizzbuzz

  test "When 2 then 2" do
    assert fizzbuzz4(2) == 2
  end

  test "When 3 then Fizz" do
    assert fizzbuzz4(3) == "Fizz"
  end

  test "When 5 then Buzz" do
    assert fizzbuzz4(5)== "Buzz"
  end

  test "When 10 then 10" do
    assert fizzbuzz4(10) == "Buzz"
  end

  test "When 11 then 11" do
    assert fizzbuzz4(11) == 11
  end

  test "When 15 then 15" do
    assert fizzbuzz4(15) == "FizzBuzz"
  end

  test "Given n, return the serie" do
    assert serie([1,2,3,4,5,10,13,15]) == [1,2,"Fizz",4,"Buzz","Buzz",13,"FizzBuzz"]
  end
end
