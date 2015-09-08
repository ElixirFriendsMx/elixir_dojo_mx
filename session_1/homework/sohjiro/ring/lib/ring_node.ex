defmodule RingNode do

  def loop do
    receive do
      {mensaje, n} ->
        "repeat #{n} times #{mensaje}"
      {:exit} ->
        IO.puts "exiting"
      after 5000 ->
        {:error, :timeout}
    end
    loop
  end

end
