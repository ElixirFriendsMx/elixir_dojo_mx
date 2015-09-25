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
      #{:error, result} ->
      #  IO.puts "Error"
      #  new_results = [result|results]
      #  loop(new_results, results_expected - 1)
      _ ->
        require Logger
        Logger.debug "Unknow message in Coordinator"
        loop(results, results_expected-1) # Esto jala!
    end
  end

end
