defmodule Counter do

  def loop(n) do
    receive do
      :inc ->
        IO.puts "Counter value: #{n+1}"
        loop(n+1)
      _ ->
        IO.puts "Unknown message"
        loop(n)
    end
  end

end
