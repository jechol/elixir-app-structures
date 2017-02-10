defmodule MyApp do
  def echo_sum_of(a, b) do
    GenServer.cast(:echo, Calc.sum(a, b))
  end
end
