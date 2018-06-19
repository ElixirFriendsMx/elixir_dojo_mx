defmodule ConsoleGreeter do

  def greet do
    receive do
      :greet -> 
        IO.puts "hello world"
    end
  end

end
