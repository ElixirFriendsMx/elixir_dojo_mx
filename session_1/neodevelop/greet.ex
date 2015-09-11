defmodule ConsoleGreeter do
  def greet(id) when is_integer(id) do
    receive do
      :greet ->
        IO.puts "Hello world: from #{id}"
        greet id
      :bye ->
        IO.puts "bye pid #{id}"
      _ ->
        greet id
    end
  end
end
