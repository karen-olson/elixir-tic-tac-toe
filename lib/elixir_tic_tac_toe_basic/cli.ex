defmodule ElixirTicTacToeBasic.CLI do
  @moduledoc """
  Starts the program.
  """

  def main(_args \\ nil) do
    ElixirTicTacToeBasic.start(%{
      ui: ElixirTicTacToeBasic.UI,
      presenter: ElixirTicTacToeBasic.Presenter,
      prompter: ElixirTicTacToeBasic.Prompter,
      player: ElixirTicTacToeBasic.Player,
      board: ElixirTicTacToeBasic.Board.new(),
      current_player: "X",
      current_move: nil
    })
  end
end
