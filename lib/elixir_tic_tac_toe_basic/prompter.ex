defmodule ElixirTicTacToeBasic.Prompter do
  @moduledoc """
  Prompts the user and returns valid input
  """

  def get_input(state) do
    %{state | current_move: _get_input(state)}
  end

  defp _get_input(%{gets: gets} = state) do
    initial_prompt = "Please choose a valid space.\n"

    validated_input = gets.(state, initial_prompt) |> validate()

    case validated_input do
      :error -> _get_input(state)
      selection -> selection
    end
  end

  defp validate(%{current_move: selection, board: board} = _state) do
      selection
      |> trim_and_parse()
      |> validate_integer()
      |> validate_availability(board)
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
