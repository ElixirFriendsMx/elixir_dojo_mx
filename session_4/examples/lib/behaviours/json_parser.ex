defmodule JSONParser do
  @behaviour Parser

  def parse(str), do: str # ... parse JSON
  def extensions, do: ["json"]
end
