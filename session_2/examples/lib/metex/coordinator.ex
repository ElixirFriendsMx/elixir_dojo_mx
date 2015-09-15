defmodule Metex.Coordinator do

  def loop(results \\ [], results_expected) do
    receive do
      {:ok, result} ->
        new_results = [result|results]
        if results_expected == length(new_results) do
          send self, :exit
        end
        loop(new_results, results_expected)
      :exit ->
        results |> Enum.sort |> Enum.join(", ") |> IO.puts
      _ ->
        require Logger
        Logger.debug "Unknow message"
        loop(results, results_expected)
    end
  end 

end
