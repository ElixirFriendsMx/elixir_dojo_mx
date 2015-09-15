defmodule Ejercicio do
  def fun(strings = [_h|_t]) do
    Enum.map strings, &String.reverse/1
  end
end
