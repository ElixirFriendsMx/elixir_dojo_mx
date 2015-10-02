defmodule Traps do
  def run do
    spawn __MODULE__, :init, []
  end

  def init do
    Process.flag :trap_exit, true
    loop()
  end

  def loop do
    IO.puts "waiting to die..."
    receive do
      msg -> 
        IO.puts "(⊙＿⊙') somebody tried to kill me! #{inspect msg}" 
      after 1000 ->
        IO.puts "Nobody tried to kill me! ^_^"
    end
    loop
  end
end
