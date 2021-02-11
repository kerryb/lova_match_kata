defmodule LoveMatch do
  defmodule Calculations do
    @moduledoc """
    Internal module to avoid being marked down for exposing helper functions
    publicly just to make them testable :-)
    """

    def count_letters(string) do
      string |> String.graphemes() |> count_letters([])
    end

    defp count_letters([], counts), do: Enum.reverse(counts)
    defp count_letters([" " | tail], counts), do: count_letters(tail, counts)

    defp count_letters([head | tail], counts) do
      {matches, remainder} = Enum.split_with(tail, &(&1 == head))
      count = 1 + length(matches)
      count_letters(remainder, [count | counts])
    end

    def calculate_percentage(_counts) do
      0
    end
  end

  def calculate(name_1, name_2) do
    "#{name_1} loves #{name_2}"
    |> Calculations.count_letters()
    |> Calculations.calculate_percentage()
  end
end
