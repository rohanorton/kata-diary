defmodule RomanNumeral do

  @spec encode(integer) :: String.t
  def encode(number) do
    Enum.reduce(1..number, "", fn(_, accumulator) -> next_numeral(accumulator) end)
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

  @spec decode(String.t) :: integer
  def decode(numeral) do
    String.to_char_list(numeral)
    |> decode_char_list
  end

  defp decode_char_list([]), do: 0
  defp decode_char_list([x]), do: decode_char(x)
  defp decode_char_list([x, y | rest]) do
    case { decode_char(x), decode_char(y) } do
      {a, a} ->
        a + a + decode_char_list(rest)
      {a, b} when a < b ->
          b - a + decode_char_list(rest)
      {a, _}  ->
          a + decode_char_list([ y | rest ])
    end
  end

  defp decode_char(char) do
    case char do
      ?I -> 1
      ?V -> 5
      ?X -> 10
      ?L -> 50
      ?C -> 100
      ?D -> 500
      ?M -> 1000
    end
  end
end
