defmodule ConsoleGreeter do
  def greet do
    receive do
      :greet -> IO.puts "Hello world"
      :bye -> IO.puts "bye"
    end
  end
end
