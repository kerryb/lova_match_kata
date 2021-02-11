defmodule LoveMatchTest do
  use ExUnit.Case
  doctest LoveMatch

  describe "LoveMatch.calculate/2" do
    test "returns the correct percentage" do
      assert LoveMatch.calculate("Simon", "Elaine") == 79
    end
  end

  describe "LoveMatch.Calculations.count_letters/1" do
    test "counts the occurrences of each letter, in order of their first occurrence" do
      assert LoveMatch.Calculations.count_letters("abcdaafbf") == [3, 2, 1, 1, 2]
    end

    test "ignores spaces" do
      assert LoveMatch.Calculations.count_letters("ab a") == [2, 1]
    end
  end
end
