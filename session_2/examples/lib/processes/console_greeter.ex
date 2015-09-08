defmodule ConsoleGreeter do

  def greet do
    receive do
      :do_it -> IO.puts "hello world!"
    end
  end

end
