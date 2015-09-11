defmodule Polite do
  require Logger

  def start_greeting do
    receive do
      {:greet, who, source} ->
        send(source, "hello #{who}:")
        start_greeting()
      {:exit} ->
        :ok
      _ ->
        Logger.info "Unrecognized message"
        start_greeting()
    end
  end

end
