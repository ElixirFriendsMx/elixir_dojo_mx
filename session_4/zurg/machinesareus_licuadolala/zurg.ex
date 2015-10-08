defmodule Zurg do
  import Enum

  @toys %{buzz: 5, woody: 10, rex: 20, hamm: 25}

  def solve() do
    time  = 0
    left  = Map.keys @toys
    right = steps = []
    [{:right, time, left, right, steps}]
      |> complete_sequences
      |> fastest
  end

  def complete_sequences(sequences) do
    if complete? sequences do
      sequences
    else  
      sequences 
        |> step 
        |> complete_sequences
    end                   
  end

  def complete?(sequences) do
    {_, _, left, _, _} = at sequences, 0
    empty? left
  end
  
  def step(sequences = [_|_]) do
    sequences 
      |> map(&step/1) 
      |> concat  
  end

  def step(seq = {:right, _time, left, _right, _steps}) do
    pairs(left) |> map &step(seq, &1)
  end

  def step(seq = {:left, _time, _left, right, _steps}) do
    right |> map &step(seq, &1)
  end

  def step({:right, time, left, right, steps}, {t1,t2}) do
    n_time  = time + max(@toys[t1], @toys[t2])
    n_left  = left -- [t1, t2]
    n_right = right ++ [t1, t2]
    n_steps = steps ++ [{:right, t1, t2}]
    {:left, n_time, n_left, n_right, n_steps}
  end

  def step({:left, time, left, right, steps}, toy) do
    n_time  = time + @toys[toy]
    n_left  = left ++ [toy]
    n_right = right -- [toy]
    n_steps = steps ++ [{:left, toy}]
    {:right, n_time, n_left, n_right, n_steps}
  end

  def pairs(toys) do
    all = for t1 <- toys, t2 <- toys, t1 != t2, do: [t1, t2]
    all |> map(&sort/1)
        |> uniq
        |> map(&List.to_tuple/1)
  end

  def fastest(sequences) do
    sequences |> sort(&compare/2) |> take 1
  end

  def compare({_,time1,_,_,_},{_,time2,_,_,_}), do: time1 < time2

end
