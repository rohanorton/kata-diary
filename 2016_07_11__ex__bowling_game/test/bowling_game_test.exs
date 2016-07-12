defmodule BowlingGameTest do
  use ExUnit.Case
  doctest BowlingGame

  defp roll_many(game, 0, _), do: game
  defp roll_many(game, number, pins) do
    game
    |> BowlingGame.roll(pins)
    |> roll_many(number - 1, pins)
  end

  defp roll_strike(game) do
    game
    |> BowlingGame.roll(10)
  end

  defp roll_spare(game) do
    game
    |> BowlingGame.roll(5)
    |> BowlingGame.roll(5)
  end

  test "gutter game" do
    score = BowlingGame.new()
            |> roll_many(20, 0)
            |> BowlingGame.score
    assert score == 0
  end

  test "all ones" do
    score = BowlingGame.new()
            |> roll_many(20, 1)
            |> BowlingGame.score
    assert score == 20
  end

  test "one spare" do
    score = BowlingGame.new()
            |> roll_spare
            |> BowlingGame.roll(3)
            |> roll_many(17, 0)
            |> BowlingGame.score
    assert score == 16
  end

  test "perfect game" do
    score = BowlingGame.new()
            |> roll_many(12, 10)
            |> BowlingGame.score
    assert score == 300
  end

  test "one strike" do
    score = BowlingGame.new()
            |> roll_strike
            |> BowlingGame.roll(3)
            |> BowlingGame.roll(4)
            |> roll_many(16, 0)
            |> BowlingGame.score
    assert score == 24
  end
end
