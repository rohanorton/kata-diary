defmodule AnagramTest do
  use ExUnit.Case
  doctest Anagram

  test "is_anagram true if word is same" do
    assert Anagram.is_anagram("foo", "foo")
  end

  test "is_anagram false if word contains different letters" do
    refute Anagram.is_anagram("foo", "bar")
  end

  test "is_anagram true is contains same letters" do
    assert Anagram.is_anagram("foo", "ofo")
  end

  test "is_anagram is case insensitive" do
    assert Anagram.is_anagram("FOO", "ofo")
  end

  test "is_anagram ignores whitespace" do
    assert Anagram.is_anagram("foo", "o  o   f")
  end

end
