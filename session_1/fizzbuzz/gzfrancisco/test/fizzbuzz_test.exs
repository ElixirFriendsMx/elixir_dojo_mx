defmodule FizzbuzzTest do
  use ExUnit.Case, async: true

  test "3 is fizz" do
    assert Fizzbuzz.fizz_buzz(3) == "fizz"
    assert Fizzbuzz.fizz_buzz2(3) == "fizz"
  end

  test "5 is buzz" do
    assert Fizzbuzz.fizz_buzz(5) == "buzz"
    assert Fizzbuzz.fizz_buzz2(5) == "buzz"
  end

  test "15 is fizz buzz" do
    assert Fizzbuzz.fizz_buzz(15) == "fizzbuzz"
    assert Fizzbuzz.fizz_buzz2(15) == "fizzbuzz"
  end
  
  test "60 is fizz buzz" do
    assert Fizzbuzz.fizz_buzz(60) == "fizzbuzz"
    assert Fizzbuzz.fizz_buzz2(60) == "fizzbuzz"
  end


  test "8 is 8" do
    assert Fizzbuzz.fizz_buzz(8) == 8
    assert Fizzbuzz.fizz_buzz2(8) == 8
  end

end
