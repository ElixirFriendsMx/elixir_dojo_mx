defmodule Metex.Coordinator do
  require Logger
  
  def loop(results \\ [], results_expected) do
    receive do
      {:ok, result} ->
        Logger.debug ":ok"
        new_results = [result|results]
        if results_expected == length(new_results) do
          send self, :exit
        end
        loop(new_results, results_expected)
      {:error, result} ->
        new_results_expected = results_expected - 1
        if new_results_expected == length(results) do
          send self, :exit
        end
        loop(results, new_results_expected)
      :exit ->
        results |> Enum.sort |> Enum.join(", ") |> IO.puts
      _ ->
        Logger.debug "Unknow message from Coordinator"
        loop(results, results_expected)
    end
  end

end
