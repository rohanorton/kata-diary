defmodule Anagram do

  def is_anagram(string_1, string_2) do
    normalise_string(string_1) == normalise_string(string_2)
  end

  defp normalise_string(string) do
    String.downcase(string)
    |> String.replace(~r/\s/, "")
    |> String.to_char_list
    |> Enum.sort
  end

end
