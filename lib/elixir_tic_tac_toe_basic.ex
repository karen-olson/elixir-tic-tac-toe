defmodule ElixirTicTacToeBasic do
  @moduledoc """
  This module starts the game.
  """

  defstruct [:ui, :player]

  def start(%{ui: ui, player: player} = config) do
    config
    |> ui.welcome()
    |> ui.display_board()
    |> player.move()
    |> ui.display_board()
  end
end
