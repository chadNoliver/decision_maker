defmodule DecisionMakerWeb.ChoiceLiveTest do
  use DecisionMakerWeb.ConnCase

  import Phoenix.LiveViewTest
  import DecisionMaker.ChoiceTableFixtures

  @create_attrs %{body: "some body", username: "some username", weight: 42}
  @update_attrs %{body: "some updated body", username: "some updated username", weight: 43}
  @invalid_attrs %{body: nil, username: nil, weight: nil}

  defp create_choice(_) do
    choice = choice_fixture()
    %{choice: choice}
  end

  describe "Index" do
    setup [:create_choice]

    test "lists all choices", %{conn: conn, choice: choice} do
      {:ok, _index_live, html} = live(conn, ~p"/choices")

      assert html =~ "Listing Choices"
      assert html =~ choice.body
    end

    test "saves new choice", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/choices")

      assert index_live |> element("a", "New Choice") |> render_click() =~
               "New Choice"

      assert_patch(index_live, ~p"/choices/new")

      assert index_live
             |> form("#choice-form", choice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#choice-form", choice: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/choices")

      assert html =~ "Choice created successfully"
      assert html =~ "some body"
    end

    test "updates choice in listing", %{conn: conn, choice: choice} do
      {:ok, index_live, _html} = live(conn, ~p"/choices")

      assert index_live |> element("#choices-#{choice.id} a", "Edit") |> render_click() =~
               "Edit Choice"

      assert_patch(index_live, ~p"/choices/#{choice}/edit")

      assert index_live
             |> form("#choice-form", choice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#choice-form", choice: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/choices")

      assert html =~ "Choice updated successfully"
      assert html =~ "some updated body"
    end

    test "deletes choice in listing", %{conn: conn, choice: choice} do
      {:ok, index_live, _html} = live(conn, ~p"/choices")

      assert index_live |> element("#choices-#{choice.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#choice-#{choice.id}")
    end
  end

  describe "Show" do
    setup [:create_choice]

    test "displays choice", %{conn: conn, choice: choice} do
      {:ok, _show_live, html} = live(conn, ~p"/choices/#{choice}")

      assert html =~ "Show Choice"
      assert html =~ choice.body
    end

    test "updates choice within modal", %{conn: conn, choice: choice} do
      {:ok, show_live, _html} = live(conn, ~p"/choices/#{choice}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Choice"

      assert_patch(show_live, ~p"/choices/#{choice}/show/edit")

      assert show_live
             |> form("#choice-form", choice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#choice-form", choice: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/choices/#{choice}")

      assert html =~ "Choice updated successfully"
      assert html =~ "some updated body"
    end
  end
end
