defmodule BowlingGame do

  def new() do
    []
  end

  def roll(game, pins) do
    game ++ [pins]
  end

  def score(game), do: score(game, 0)
  defp score([], score), do: score
  defp score(game, score) do
    case game do
      [10, b, c | rest ] -> score([b, c | rest], 10 + b + c + score)
      [a, b, c | rest ] when a + b == 10 -> score([c | rest], 10 + c + score)
      [a, b | rest ] -> score(rest, a + b + score)
    end
  end
end
