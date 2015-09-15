defmodule RingProcess do

  def start do
    pid = spawn(RingProcess, :init, [self])
    receive do
      process ->
        {pid, process}
    end
  end

  def init(caller) do
    process = for _n <- 1..5, do: spawn_monitor(NodeProcess, :loop, [self])
    send(caller, process)
    loop(process)
  end

  defp loop(process) do
    receive do
      {:DOWN, ref, _, pid, _} ->
        IO.puts "down with pid : #{inspect pid}"
        process = List.delete(process, {pid, ref})
        case Enum.empty? process do
          true ->
            IO.puts "My job here is done"
          _ ->
            loop process
        end

      {:next, {msg, times}, pid_incoming} when times >= 0 ->
        process = [{pid, _ref} | _t] = calculate_next(process, pid_incoming)
        send(pid, {msg, times})
        loop(process)

      :exit ->
        for {pid, _ref} <- process, do: send(pid, :exit)
    end
  end

  defp calculate_next([h = {pid, _ref} | t], pid_incoming) when pid == pid_incoming do
    t ++ [h]
  end

  defp calculate_next([h | t], pid_incoming)do
    calculate_next(t ++ [h], pid_incoming)
  end
end


defmodule NodeProcess do

  def loop(caller) do
    receive do
      :exit ->
        IO.puts "Terminating #{inspect self}"

      {_msg, 0} ->
        loop(caller)

      {msg, times} ->
        IO.puts "echo : #{inspect msg} in #{inspect self}. Notifying to #{inspect caller}"
        send(caller, {:next, {msg, times - 1}, self})
        loop(caller)

      _ ->
        IO.puts "These isn't the message you're looking for"
        loop(caller)
    end
  end

end
