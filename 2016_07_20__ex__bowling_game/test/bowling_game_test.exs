defmodule BowlingGameTest do
  use ExUnit.Case
  doctest BowlingGame

  test "score gutter game" do
    game = spawn_link(BowlingGame, :start, [])
    roll_many(game, 20, 0)
    assert_score_is 0, game
  end

  test "all ones" do
    game = spawn_link(BowlingGame, :start, [])
    roll_many(game, 20, 1)
    assert_score_is 20, game
  end

  test "one spare" do
    game = spawn_link(BowlingGame, :start, [])
    roll_spare(game)
    send(game, {:roll, 3})
    roll_many(game, 17, 0)
    assert_score_is 16, game
  end

  test "one strike" do
    game = spawn_link(BowlingGame, :start, [])
    roll_strike(game)
    send(game, {:roll, 3})
    send(game, {:roll, 4})
    roll_many(game, 16, 0)
    assert_score_is 24, game
  end

  test "perfect game" do
    game = spawn_link(BowlingGame, :start, [])
    roll_many(game, 12, 10)
    assert_score_is 300, game
  end

  defp roll_many(game, 0, _), do: game
  defp roll_many(game, rolls, pins) do
    send(game, {:roll, pins})
    roll_many(game, rolls - 1, pins)
  end

  defp roll_spare(game) do
    roll_many(game, 2, 5)
  end

  defp roll_strike(game) do
    roll_many(game, 1, 10)
  end

  defp assert_score_is(expected_score, game) do
    send(game, {:get_score, self})
    assert_receive {:score, ^expected_score}
  end
end
