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
      {_message, 0} ->
        IO.puts "Process terminated in :server_a"
      {message, times} ->
        IO.puts "ping: :message : #{message} times : #{times}"
        send(:server_b, {message, times - 1})
    end
    loop_a
  end

  defp loop_b do
    receive do
      {_message, 0} ->
        IO.puts "Process terminated in :server_b"
      {message, times} ->
        IO.puts "pong: message : #{message} times : #{times}"
        send(:server_a, {message, times - 1})
    end
    loop_b
  end

  def send_message(message, times) do
    send(:server_a, {message, times})
  end

end
