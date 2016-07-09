defmodule RomanNumeral do

  def encode(num) do
    Enum.reduce(1..num, "", fn(_, accumulator) -> next_numeral(accumulator) end)
  end

  defp next_numeral(current_numeral) do
    current_numeral <> "I"
    |> String.replace("IIII", "IV")
    |> String.replace("IVI", "V")
    |> String.replace("VIV", "IX")
    |> String.replace("IXI", "X")
    |> String.replace("XXXX", "XL")
    |> String.replace("XLX", "L")
    |> String.replace("LXL", "XC")
    |> String.replace("XCX", "C")
    |> String.replace("CCCC", "CD")
    |> String.replace("CDC", "D")
    |> String.replace("DCD", "CM")
    |> String.replace("CMC", "M")
  end
end
