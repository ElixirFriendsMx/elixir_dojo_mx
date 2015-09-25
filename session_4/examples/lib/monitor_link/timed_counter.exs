
pid = spawn fn ->
  Enum.each 1..20, fn(idx) ->
    IO.puts "hola #{idx}!"
    :timer.sleep 1000
  end
end

Process.monitor pid
