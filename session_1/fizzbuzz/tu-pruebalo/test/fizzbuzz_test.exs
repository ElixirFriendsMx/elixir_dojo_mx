defmodule FizzbuzzTest do
  use ExUnit.Case

  test "multiplo de tres - fizz" do
    assert "fizz" == Fizzbuzz.fizzbuzz(9)
  end

  test "multiplo de cinco - buzz" do
    assert "buzz" == Fizzbuzz.fizzbuzz(5)
  end

  test "multiplo de los dos - fizzbuzz" do
    assert "fizzbuzz" == Fizzbuzz.fizzbuzz(15)
  end
  test "si no coincide, imprime el numero" do
    assert "1" == Fizzbuzz.fizzbuzz(1)
  end
end
