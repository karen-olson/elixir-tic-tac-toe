defmodule ElixirTicTacToeBasic.Validator do
  @moduledoc """
  This module determines whether the user's input is a valid integer,
  as well as whether it corresponds to an available space on the board.
  """

  def validate(%{current_move: selection, board: board} = _state) do
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
