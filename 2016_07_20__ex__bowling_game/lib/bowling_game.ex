defmodule BowlingGame do
  def start do
    await([])
  end

  def await(rolls) do
    receive do
      {:roll, pins} -> rolls = update_game(rolls, pins)
      {:get_score, pid} -> send_score(pid, rolls)
    end
    await(rolls)
  end

  defp update_game(rolls, pins) do
    rolls ++ [pins]
  end

  defp send_score(pid, rolls) do
    send(pid, {:score, calculate_score(rolls) })
  end

  defp calculate_score(rolls) do
    calculate_frames(rolls, 0, 0)
  end

  defp calculate_frames([], _, total), do: total
  defp calculate_frames(_, 10, total), do: total
  defp calculate_frames(rolls, frame_index, total) do
    calculate_frames(get_next_frame(rolls), frame_index + 1, total + calculate_frame(rolls))
  end

  defp calculate_frame(rolls) do
    basic_score = calculate_basic_score(rolls)
    spare_bonus = calculate_spare_bonus(rolls)
    strike_bonus = calculate_strike_bonus(rolls)

    basic_score + spare_bonus + strike_bonus
  end

  defp calculate_basic_score(rolls) do
    case rolls do
      [10 | _] -> 10
      [x, y | _] -> x + y
      _ -> 0
    end
  end

  defp calculate_spare_bonus(rolls) do
    case rolls do
      [10, _ | _] -> 0
      [_, 10 | _] -> 0
      [x, y, z | _] when x + y == 10 -> z
      _ -> 0
    end
  end

  defp calculate_strike_bonus(rolls) do
    case rolls do
      [10, x, y | _] -> x + y
      _ -> 0
    end
  end

  defp get_next_frame(rolls) do
    case rolls do
      [10 | _] -> tl(rolls)
      _ -> tl(tl(rolls))
    end
  end
end
