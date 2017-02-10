defmodule Calc do
  def sum(a, b) do
    Decimal.add(Decimal.new(a), Decimal.new(b))
  end
end
