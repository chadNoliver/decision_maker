defmodule DecisionMaker.ChoiceTableTest do
  use DecisionMaker.DataCase

  alias DecisionMaker.ChoiceTable

  describe "choices" do
    alias DecisionMaker.ChoiceTable.Choice

    import DecisionMaker.ChoiceTableFixtures

    @invalid_attrs %{body: nil, username: nil, weight: nil}

    test "list_choices/0 returns all choices" do
      choice = choice_fixture()
      assert ChoiceTable.list_choices() == [choice]
    end

    test "get_choice!/1 returns the choice with given id" do
      choice = choice_fixture()
      assert ChoiceTable.get_choice!(choice.id) == choice
    end

    test "create_choice/1 with valid data creates a choice" do
      valid_attrs = %{body: "some body", username: "some username", weight: 42}

      assert {:ok, %Choice{} = choice} = ChoiceTable.create_choice(valid_attrs)
      assert choice.body == "some body"
      assert choice.username == "some username"
      assert choice.weight == 42
    end

    test "create_choice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ChoiceTable.create_choice(@invalid_attrs)
    end

    test "update_choice/2 with valid data updates the choice" do
      choice = choice_fixture()
      update_attrs = %{body: "some updated body", username: "some updated username", weight: 43}

      assert {:ok, %Choice{} = choice} = ChoiceTable.update_choice(choice, update_attrs)
      assert choice.body == "some updated body"
      assert choice.username == "some updated username"
      assert choice.weight == 43
    end

    test "update_choice/2 with invalid data returns error changeset" do
      choice = choice_fixture()
      assert {:error, %Ecto.Changeset{}} = ChoiceTable.update_choice(choice, @invalid_attrs)
      assert choice == ChoiceTable.get_choice!(choice.id)
    end

    test "delete_choice/1 deletes the choice" do
      choice = choice_fixture()
      assert {:ok, %Choice{}} = ChoiceTable.delete_choice(choice)
      assert_raise Ecto.NoResultsError, fn -> ChoiceTable.get_choice!(choice.id) end
    end

    test "change_choice/1 returns a choice changeset" do
      choice = choice_fixture()
      assert %Ecto.Changeset{} = ChoiceTable.change_choice(choice)
    end
  end
end
