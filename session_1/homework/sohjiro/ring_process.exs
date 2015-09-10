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
      {pid, :kill} ->
        send(pid, {:exit})
      {_, _, 0} ->
        IO.puts "Ending ring process"
      {[h | t], message, times} ->
        IO.puts "#{inspect h}, #{inspect t}, #{message} : #{times}"
        send(h, message)
        :timer.sleep(1000)
        send(:ring, {t ++ [h], message, times - 1})
        loop()
    end
  end

  def end_process(pid) do
    send(:ring, {pid, :kill})
  end

  def send_message(nodes, {message, times}) do
    send(:ring, {nodes, message, times})
  end

end

defmodule NodeProcess do
  def loop do
    receive do
      {:exit} ->
        IO.puts "Ending message"
      message ->
        IO.puts "#{inspect self} : #{message}"
        loop()
    end
  end
end
