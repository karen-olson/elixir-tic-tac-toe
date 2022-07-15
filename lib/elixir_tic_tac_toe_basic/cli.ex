defmodule ElixirTicTacToeBasic.CLI do
  @moduledoc """
  Starts the program.
  """

  def main(_args \\ nil) do
    ElixirTicTacToeBasic.start(%{
      ui: ElixirTicTacToeBasic.UI,
      presenter: ElixirTicTacToeBasic.Presenter,
      player: ElixirTicTacToeBasic.Player,
      board: Helpers.EmptyBoard.empty_board(),
      current_player: "X",
      current_move: nil
    })
  end
end
