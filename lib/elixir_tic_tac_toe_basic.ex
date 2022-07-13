defmodule ElixirTicTacToeBasic do
  @moduledoc """
  This module creates a Game struct and starts running the game.
  """

  defstruct [:ui]

  def start(%{ui: ui} = config) do
    config
    |> ui.welcome()
    |> ui.display_board()
  end
end
