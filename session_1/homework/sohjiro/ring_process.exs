defmodule RingProcess do

  def start do
    spawn(fn ->
      Process.register(self, :server_a)
      loop_a()
    end)

    spawn(fn ->
      Process.register(self, :server_b)
      loop_b()
    end)
  end

  defp loop_a do
    receive do
      {:kill} ->
        IO.puts "killing a"
      {_message, _times, 0} ->
        IO.puts "Sending message to kill b"
        send(:server_b, {:kill})
      {message, times, remaining} ->
        IO.puts "ping: :message : #{message} times : #{times}, remaining : #{remaining}"
        send(:server_b, {message, times, remaining - 1})
        loop_a
    end
  end

  defp loop_b do
    receive do
      {:kill} ->
        IO.puts "killing b"
      {_message, _times, 0} ->
        IO.puts "Sending message to kill a"
        send(:server_a, {:kill})
      {message, times, remaining} ->
        IO.puts "pong: :message : #{message} times : #{times}, remaining : #{remaining}"
        send(:server_a, {message, times, remaining - 1})
        loop_b
    end
  end

  def send_message(message, times) do
    send(:server_a, {message, times, times})
  end

end
