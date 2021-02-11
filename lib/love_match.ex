defmodule LoveMatch do
  defmodule Calculations do
    @moduledoc """
    Internal module to avoid being marked down for exposing helper functions
    publicly just to make them testable :-)
    """

    def count_letters(_string) do
      []
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
