defmodule YAMLParser do
  @behaviour Parser

  def parse(str), do: str # ... parse YAML
  def extensions, do: ["yml"]
end

