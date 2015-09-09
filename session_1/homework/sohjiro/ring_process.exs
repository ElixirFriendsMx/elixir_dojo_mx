defmodule RingProcess do
  def start do
    spawn(fn ->
      Process.register(self, :server_a)
      loop()
    end)
  end


  defp loop do
    receive do
      {_message, _times, 0} ->
        IO.puts "killing server"
      {message, times, remaining} ->
        IO.puts "ping: :message : #{message} times : #{times}, remaining : #{remaining}"
        send(:server_a, {message, times, remaining - 1})
        loop()
    end
  end

  def send_message(message, times) do
    send(:server_a, {message, times, times})
  end

end
