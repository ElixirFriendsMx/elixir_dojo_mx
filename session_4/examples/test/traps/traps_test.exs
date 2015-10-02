defmodule TrapsTest do
  use ExUnit.Case, async: true

  setup do
    pid = Traps.run
    {:ok, pid: pid}
  end

  test ":normal exit cause should be ignored", %{pid: pid} do
    Process.exit pid, :normal
    :timer.sleep 100
    assert Process.alive? pid
  end

  test "arbitrary exit cause should be ignored", %{pid: pid} do
    Process.exit pid, :i_want_you_to_die
    :timer.sleep 100
    assert Process.alive? pid
  end

  test ":exit cause should kill the process", %{pid: pid} do
    Process.exit pid, :kill
    :timer.sleep 100
    refute Process.alive? pid
  end

end
