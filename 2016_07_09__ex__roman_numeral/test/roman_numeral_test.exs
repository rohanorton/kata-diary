defmodule RomanNumeralTest do
  use ExUnit.Case, async: true
  use ExCheck
  doctest RomanNumeral

  test "encode returns I for number 1" do
    assert RomanNumeral.encode(1) == "I"
  end

  test "encode returns II for number 2" do
    assert RomanNumeral.encode(2) == "II"
  end

  test "encode returns IV for number 4" do
    assert RomanNumeral.encode(4) == "IV"
  end

  test "encode returns V for number 5" do
    assert RomanNumeral.encode(5) == "V"
  end

  test "encode returns IX for number 9" do
    assert RomanNumeral.encode(9) == "IX"
  end

  test "encode returns X for number 10" do
    assert RomanNumeral.encode(10) == "X"
  end

  test "encode returns XL for number 40" do
    assert RomanNumeral.encode(40) == "XL"
  end

  test "encode returns L for number 50" do
    assert RomanNumeral.encode(50) == "L"
  end

  test "encode returns XC for number 90" do
    assert RomanNumeral.encode(90) == "XC"
  end

  test "encode returns C for number 100" do
    assert RomanNumeral.encode(100) == "C"
  end

  test "encode returns CD for number 400" do
    assert RomanNumeral.encode(400) == "CD"
  end

  test "encode returns D for number 500" do
    assert RomanNumeral.encode(500) == "D"
  end

  test "encode returns CM for number 900" do
    assert RomanNumeral.encode(900) == "CM"
  end

  test "encode returns M for number 1000" do
    assert RomanNumeral.encode(1000) == "M"
  end


  test "decode returns number 1 for I" do
    assert RomanNumeral.decode("I") == 1
  end

  test "decode returns number 2 for II" do
    assert RomanNumeral.decode("II") == 2
  end

  test "decode returns number 4 for IV" do
    assert RomanNumeral.decode("IV") == 4
  end

  test "decode returns number 5 for V" do
    assert RomanNumeral.decode("V") == 5
  end

  test "decode returns number 6 for VI" do
    assert RomanNumeral.decode("VI") == 6
  end

  test "decode returns number 9 for IX" do
    assert RomanNumeral.decode("IX") == 9
  end

  test "decode returns number 9 for X" do
    assert RomanNumeral.decode("X") == 10
  end

  test "decode returns number 39 for XXXIX" do
    assert RomanNumeral.decode("XXXIX") == 39
  end


  property "encode and decode are inverse operations" do
    for_all x in int(0, 5000) do
      RomanNumeral.encode(x)
      |> RomanNumeral.decode == x
    end
  end

end
