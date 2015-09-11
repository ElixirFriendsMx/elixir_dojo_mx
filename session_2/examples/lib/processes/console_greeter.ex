defmodule ConsoleGreeter do

  def greet do
    receive do
      :greet -> 
        IO.puts "hello world! from #{inspect self}"
        greet 
      :bye -> 
        IO.puts "bye! from #{inspect self}"
      _ ->
        greet
    end
  end

end
