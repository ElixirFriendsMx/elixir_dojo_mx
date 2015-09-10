defmodule RingProcess do
  def start do
    spawn(fn ->
      Process.register(self, :ring)
      loop()
    end)
    for _n <- 1..5, do: spawn(NodeProcess, :loop, [])
  end

  defp loop do
    receive do
      {[h | t], message, times} ->
        IO.puts "#{inspect h}, #{inspect t}, #{message} : #{times}"
        loop()
    end
  end

  def send_message(nodes, {message, times}) do
    send(:ring, {nodes, message, times})
  end

end

defmodule NodeProcess do

  def loop do
    receive do
      message ->
        IO.puts "message incoming : #{message}"
        loop()
    end
  end

end
