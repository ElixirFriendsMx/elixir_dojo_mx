defmodule ConsoleGreeter do
  def greet do
    receive do
      :greet ->
        IO.puts "Hello world"
        greet
      :bye ->
        IO.puts "bye"
      _ ->
        greet
    end
  end
end
