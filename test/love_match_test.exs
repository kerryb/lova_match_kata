defmodule LoveMatchTest do
  use ExUnit.Case
  doctest LoveMatch

  describe "LoveMatch.calculate/2" do
    test "returns the correct percentage" do
      assert LoveMatch.calculate("Simon", "Elaine") == 79
    end
  end
end
