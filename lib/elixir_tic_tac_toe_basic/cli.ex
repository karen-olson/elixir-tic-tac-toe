defmodule ElixirTicTacToeBasic.CLI do
  @moduledoc """
  Starts the program.
  """

  def main() do
    ElixirTicTacToeBasic.start(%{
      ui: ElixirTicTacToeBasic.UI,
      presenter: ElixirTicTacToeBasic.Presenter,
      board: %{
        {0, 0} => 1,
        {0, 1} => 2,
        {0, 2} => 3,
        {1, 0} => 4,
        {1, 1} => 5,
        {1, 2} => 6,
        {2, 0} => 7,
        {2, 1} => 8,
        {2, 2} => 9
      }
    })
  end
end
