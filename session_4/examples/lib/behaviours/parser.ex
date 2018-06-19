defmodule Parser do
  use Behaviour
  defcallback parse(String.t) :: any # Macro
  defcallback extensions() :: [String.t]
end
