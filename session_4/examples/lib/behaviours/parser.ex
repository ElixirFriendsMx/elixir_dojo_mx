defmodule Parser do
  use Behaviour
  defcallback parse(String.t) :: any
  defcallback extensions() :: [String.t]
end
