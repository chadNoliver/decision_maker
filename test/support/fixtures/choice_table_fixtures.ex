defmodule DecisionMaker.ChoiceTableFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DecisionMaker.ChoiceTable` context.
  """

  @doc """
  Generate a choice.
  """
  def choice_fixture(attrs \\ %{}) do
    {:ok, choice} =
      attrs
      |> Enum.into(%{
        body: "some body",
        username: "some username",
        weight: 42
      })
      |> DecisionMaker.ChoiceTable.create_choice()

    choice
  end
end
