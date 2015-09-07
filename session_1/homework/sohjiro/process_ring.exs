defmodule ProcessRing do

  def start do
    for n <- 1..5 do
      spawn_monitor(fn ->
        register_name = to_string([97 + n]) |> String.to_atom
        Process.register(self, register_name)
        loop()
      end)
    end
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

  def send_message(atom, {message, n}), do: send(atom, {message, n})

end
