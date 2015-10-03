defmodule Zurg do
  import Enum

  @toys %{buzz: 5, woody: 10, rex: 20, hamm: 25}

  def solve() do
    time  = 0
    left  = Map.keys @toys
    right = steps = []
    [{:right, time, left, right, steps}]
      |> complete_sequences
      |> sort(&compare/2)  
      |> take 1
  end

  def complete_sequences(sequences) do
    if complete? sequences do
      sequences
    else  
      sequences |> map(&next_steps/1)
                |> concat 
                |> complete_sequences
    end                   
  end

  def complete?(sequences) do
    {_, _, left, _, _} = at sequences, 0
    empty? left
  end

  def compare({_,time1,_,_,_},{_,time2,_,_,_}) do
    time1 < time2
  end

  def next_steps(seq = {dir, _time, left, right, _steps}) do
    case dir do
      :right -> 
         options(left)
           |> map(&cross_right(seq, &1))
      :left ->
         right
           |> map(&cross_left(seq, &1))
    end
  end

  def cross_right({dir, time, left, right, steps}, {t1,t2}) do
    n_left  = left -- [t1, t2]
    n_right = right ++ [t1, t2]
    n_time  = time + max(@toys[t1], @toys[t2])
    n_steps = steps ++ [{dir,t1,t2}]
    {:left, n_time, n_left, n_right, n_steps}
  end

  def cross_left({dir, time, left, right, steps}, toy) do
    n_left  = left ++ [toy]
    n_right = right -- [toy]
    n_time  = time + @toys[toy]
    n_steps = steps ++ [{dir, toy}]
    {:right, n_time, n_left, n_right, n_steps}
  end

  def options(toys) do
    opts = for t1 <- toys, t2 <- toys, t1 != t2, do: [t1, t2]
    opts |> map(&sort/1)
         |> uniq
         |> map(&List.to_tuple/1)
  end
end
