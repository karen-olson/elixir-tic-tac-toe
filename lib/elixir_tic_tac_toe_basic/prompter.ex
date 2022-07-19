defmodule ElixirTicTacToeBasic.Prompter do
  @moduledoc """
  Prompts the user and returns valid input
  """

  def get_input(%{current_move: prev_selection} = state) when prev_selection in 1..9 do
    state
  end

  def get_input(%{current_move: prev_selection, gets: gets} = state)
      when not is_nil(prev_selection) do
    error_prompt = "Please enter a valid number.\n"

    gets.(state, error_prompt)
    |> validate()
    |> get_input()
  end

  def get_input(%{gets: gets} = state) do
    initial_prompt = "Please choose a space.\n"

    gets.(state, initial_prompt)
    |> validate()
    |> get_input()
  end

  defp validate(%{current_move: selection, board: board} = state) do
    converted_selection =
      selection
      |> trim_and_parse()
      |> validate_integer()
      |> validate_availability(board)

    Map.put(state, :current_move, converted_selection)
  end

  defp trim_and_parse(selection) do
    selection
    |> String.trim()
    |> Integer.parse()
  end

  defp validate_integer(selection) do
    if selection == :error, do: selection, else: elem(selection, 0)
  end

  defp validate_availability(selection, board) do
    if Map.get(board, selection) in 1..9, do: selection, else: :error
  end
end
