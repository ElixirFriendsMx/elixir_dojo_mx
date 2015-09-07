defmodule ProcessRing do

  def start do
    for n <- 1..5, do: spawn(&loop/0)
  end

  def loop do
    receive do
      {message, n} ->
        IO.puts "message : #{message} with n : #{n}"
    after 5000 ->
      {:error, :timeout}
    end
    loop
  end

end
