defmodule Mestos do
  def fun(strings) when is_list(strings) do
    Enum.map strings, fn(s) -> String.reverse s end
  end
end

defmodule Mestos do
  def fun(lista = [head|tail]) do
    Enum.map lista, fn(s) -> String.reverse s end
  end
end

defmodule Mestos do
  def fun([head|tail]) do
    Enum.map [head|tail], fn(s) -> String.reverse s end
  end
end

defmodule Mestos do
  def fun([_head|_tail]) do
    Enum.map [head|tail], fn(s) -> String.reverse s end
  end
end

defmodule Mestos do
  def fun([_head|_tail]) do
    Enum.map [head|tail], &String.reverse/1
  end
end
