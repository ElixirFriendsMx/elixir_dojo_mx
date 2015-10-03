defmodule TrapsMonitoredTest do
  use ExUnit.Case, async: true

  setup do
    {pid, ref} = Traps.run_monitored
    {:ok, pid: pid, ref: ref}
  end

  test ":normal exit cause should be ignored", %{pid: pid} do
    Process.exit pid, :normal
    :timer.sleep 100
    assert Process.alive? pid
    refute_receive {:DOWN, _, :process, pid, _}, 500
  end

  test "arbitrary exit cause should be ignored", %{pid: pid} do
    Process.exit pid, :i_want_you_to_die
    :timer.sleep 100
    assert Process.alive? pid
    refute_receive {:DOWN, _, :process, pid, _}, 500
  end

  test ":exit cause should kill the process", %{pid: pid} do
    Process.exit pid, :kill
    :timer.sleep 100
    refute Process.alive? pid
    assert_receive {:DOWN, _, :process, pid, _}, 200
  end
end
