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

    test "ignores case" do
      assert LoveMatch.Calculations.count_letters("abA") == [2, 1]
    end
  end

  describe "LoveMatch.Calculations.calculate_percentage/1" do
    test "iteratively sums edge pairs until the result has two digits" do
      assert LoveMatch.Calculations.calculate_percentage([2, 2, 1, 2, 2, 2, 1, 3, 1]) == 79
    end
  end

  describe "LoveMatch.Calculations.sum_edge_pairs/1" do
    test "sums edge pairs working inwards" do
      assert LoveMatch.Calculations.sum_edge_pairs([1, 2, 4, 8]) == [9, 6]
    end

    test "handles odd-length lists" do
      assert LoveMatch.Calculations.sum_edge_pairs([1, 2, 3, 4, 8]) == [9, 6, 3]
    end

    test "splits up two-digit numbers" do
      assert LoveMatch.Calculations.sum_edge_pairs([6, 2, 5]) == [1, 1, 2]
    end
  end
end
