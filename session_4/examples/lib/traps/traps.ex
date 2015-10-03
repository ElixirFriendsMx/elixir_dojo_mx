defmodule Traps do
  require Logger

  def run do
    spawn __MODULE__, :init, []
  end

  def run_monitored do
    spawn_monitor __MODULE__, :init, []
  end

  def init do
    Process.flag :trap_exit, true
    loop()
  end

  def loop do
    Logger.info "waiting to die..."
    receive do
      msg -> 
        Logger.info "(⊙＿⊙') somebody tried to kill me! #{inspect msg}" 
      after 500 ->
        Logger.info "Nobody tried to kill me! ^_^"
    end
    loop
  end
end
