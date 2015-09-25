defmodule PoliteGreeter do
  require Logger

  def start_greeting do
    receive do 
      {:greet, who, dest} ->
        send dest, "Hello #{who}!"
        start_greeting
      :exit -> 
        :ok
      _ -> 
        Logger.info "Unrecognized message"
        start_greeting 
    end
  end
end
