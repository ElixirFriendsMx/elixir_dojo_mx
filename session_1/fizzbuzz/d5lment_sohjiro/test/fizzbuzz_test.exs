defmodule FizzbuzzTest do
  use ExUnit.Case, async: true
  import Fizzbuzz

  test "return the number" do
    assert 1 == fizzbuzz(1)
  end

  test "return fizz" do
    assert "fizz" == fizzbuzz(3)
  end

  test "return buzz" do
    assert "buzz" == fizzbuzz(5)
  end

  test "return fizzbuzz" do
    assert "fizzbuzz" == fizzbuzz(15)
  end

  test "fizzbuzz de 7 elementos" do
    values = [1, 2, 5, 6, 10, 15, 50]
    assert [1, 2, "buzz", "fizz", "buzz", "fizzbuzz", "buzz"] == Enum.map(values, fn(x) -> fizzbuzz(x) end)
  end

end
