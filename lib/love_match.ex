defmodule LoveMatch do
  defmodule Calculations do
    @moduledoc """
    Internal module to avoid being marked down for exposing helper functions
    publicly just to make them testable :-)
    """

    def count_letters(string) do
      string |> String.downcase() |> String.graphemes() |> count_letters([])
    end

    defp count_letters([], counts), do: Enum.reverse(counts)
    defp count_letters([" " | tail], counts), do: count_letters(tail, counts)

    defp count_letters([head | tail], counts) do
      {matches, remainder} = Enum.split_with(tail, &(&1 == head))
      count = 1 + length(matches)
      count_letters(remainder, [count | counts])
    end

    def calculate_percentage([a, b]), do: a * 10 + b
    def calculate_percentage(counts), do: counts |> sum_edge_pairs() |> calculate_percentage()

    def sum_edge_pairs(counts) do
      middle = ceil(length(counts) / 2)
      {left, right} = Enum.split(counts, middle)
      padded_right = if length(right) < middle, do: [0 | right], else: right
      sum_pairs(left, Enum.reverse(padded_right))
    end

    defp sum_pairs(list_1, list_2) do
      list_1
      |> Enum.zip(list_2)
      |> Enum.map(fn {a, b} -> a + b end)
      |> Enum.flat_map(&digits/1)
    end

    defp digits(number) when number < 10, do: [number]
    defp digits(number), do: [div(number, 10), Integer.mod(number, 10)]
  end

  def calculate(name_1, name_2) do
    "#{name_1} loves #{name_2}"
    |> Calculations.count_letters()
    |> Calculations.calculate_percentage()
  end
end
