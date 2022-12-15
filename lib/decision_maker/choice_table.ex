defmodule DecisionMaker.ChoiceTable do
  @moduledoc """
  The ChoiceTable context.
  """

  import Ecto.Query, warn: false
  alias DecisionMaker.Repo

  alias DecisionMaker.ChoiceTable.Choice

  @doc """
  Returns the list of choices.

  ## Examples

      iex> list_choices()
      [%Choice{}, ...]

  """
  def list_choices do
    Repo.all(from c in Choice, order_by: [desc: c.id])
    # Repo.all(Choice)
  end

  @doc """
  Gets a single choice.

  Raises `Ecto.NoResultsError` if the Choice does not exist.

  ## Examples

      iex> get_choice!(123)
      %Choice{}

      iex> get_choice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_choice!(id), do: Repo.get!(Choice, id)

  @doc """
  Creates a choice.

  ## Examples

      iex> create_choice(%{field: value})
      {:ok, %Choice{}}

      iex> create_choice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_choice(attrs \\ %{}) do
    %Choice{}
    |> Choice.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:choice_created)
  end

  @doc """
  Updates a choice.

  ## Examples

      iex> update_choice(choice, %{field: new_value})
      {:ok, %Choice{}}

      iex> update_choice(choice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_choice(%Choice{} = choice, attrs) do
    choice
    |> Choice.changeset(attrs)
    |> Repo.update()
    |> broadcast(:choice_updated)
  end

  @doc """
  Deletes a choice.

  ## Examples

      iex> delete_choice(choice)
      {:ok, %Choice{}}

      iex> delete_choice(choice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_choice(%Choice{} = choice) do
    {:ok, %Choice{}} = Repo.delete(choice)
    broadcast({:ok, choice}, :choice_deleted)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking choice changes.

  ## Examples

      iex> change_choice(choice)
      %Ecto.Changeset{data: %Choice{}}

  """
  def change_choice(%Choice{} = choice, attrs \\ %{}) do
    Choice.changeset(choice, attrs)
  end
  
  def subscribe do
    Phoenix.PubSub.subscribe(DecisionMaker.PubSub, "choices")
  end

  
  defp broadcast({:error, _reason} = error, _event), do: error
  defp broadcast({:ok, choice}, event) do
    Phoenix.PubSub.broadcast(DecisionMaker.PubSub, "choices", {event, choice})
      {:ok, choice}
  end
end
