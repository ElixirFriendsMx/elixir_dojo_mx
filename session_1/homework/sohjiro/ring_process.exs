defmodule RingProcess do
  def start do
    spawn_monitor(NodeProcess, :loop, [])
  end


  defp loop do
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
