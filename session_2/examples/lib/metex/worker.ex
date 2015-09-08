defmodule Metex.Worker do
  require Logger

  def temperature_of(location) do
    result = url_for(location) |> HTTPoison.get |> parse_response
    case result do
      {:ok, temp} ->
        "#{location}: #{temp}°C"
      :error ->
        "#{location} not found"
    end 
  end

  defp url_for(location) do
    "http://api.openweathermap.org/data/2.5/weather?q=#{location}"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    #body |> JSON.decode! |> IO.inspect
    #body |> Logger.debug
    body |> JSON.decode! |> compute_temperature
  end
  
  defp parse_response(_) do
    :error
  end
  
  defp compute_temperature(json) do
    try do
      temp = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :error
    end
  end

end

#  require Logger
#
#  def loop do
#    receive do
#      {sender_pid, location} ->
#        send sender_pid, temperature_of(location)
#      _ ->
#        Logger.warn "Unknown message"
#    end
#  end
#
#end
