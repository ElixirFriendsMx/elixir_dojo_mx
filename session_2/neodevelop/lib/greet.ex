defmodule ConsoleGreeter do
  def greet do
    receive do
      :greet ->
        IO.puts "Hello world: from #{inspect self}"
        greet
      :bye ->
        IO.puts "bye pid #{inspect self}"
      _ ->
        greet
    end
  end
end
