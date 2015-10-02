defmodule RingCoordinator do
  require Logger

  def start(n) when n > 1 do
    workers = Enum.map 1..n, &(spawn RingWorker, :loop, [&1])
    for {pid, idx} <- Enum.with_index(workers) do
      next_idx = rem(idx + 1, n)
      send pid, {:link, {next_idx + 1, Enum.at(workers, next_idx)}}
    end
    coord = spawn __MODULE__, :init, [workers]
    {coord, workers}
  end

  def init(workers) do
    workers |> Enum.each &(Process.monitor &1)
    loop(workers)
  end

  def loop(pids) do
    receive do
      :exit ->
        pids |> Enum.each &(send &1, :exit)
        loop(pids)
      {:DOWN,_,_,pid,_} ->
        Logger.info "#{inspect pid} is down!"
        remaining = pids -- [pid]
        case Enum.empty? remaining do
          true ->
            :ok
          _ ->
            loop remaining
        end
      _ ->
        loop pids
    end
  end

end
