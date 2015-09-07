defmodule ProcessRing do

  def start do
    for _n <- 1..5, do: spawn_monitor(&loop/0)
  end

  defp loop do
    receive do
      {message, n} ->
        IO.puts "message : #{message} with n : #{n}"
    after 5000 ->
      {:error, :timeout}
    end
    loop
  end

  def process_message({message, n}) do
    IO.puts "message : #{message} with n : #{n}"
  end

end
