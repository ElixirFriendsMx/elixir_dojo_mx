defmodule RingWorker do
  require Logger

  def loop(idx) do
    receive do
      {:link, {linked_id, linked_pid}} ->
        Logger.info "#{idx} linked with #{linked_id}"
        loop idx, {linked_id, linked_pid}
      _ -> 
        loop idx
    end
  end

  def loop(idx, {_next_idx, next_pid} = next) do
    receive do 
      {msg, 1} -> 
        Logger.info "#{idx} received: #{inspect msg}"
        loop idx, next
      {msg, n} when n > 1 -> 
        Logger.info "#{idx} received: #{inspect msg}"
        send next_pid, {msg, n - 1}
        loop idx, next
      :exit ->
        Logger.info "Terminating #{inspect self}"
        :ok
      _ -> 
        Logger.info "#{inspect self} received an unknown message"
        :ok
        loop idx, next
    end
  end

end
