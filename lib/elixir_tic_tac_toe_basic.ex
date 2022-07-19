defmodule ElixirTicTacToeBasic do
  @moduledoc """
  This module starts the game.
  """

  defstruct [:ui, :player]

  def start(%{ui: ui, player: player} = config) do
    config
    |> start_game()
    |> take_turn()
    |> take_turn()
  end

  defp start_game(%{ui: ui, player: player} = config) do
    config
    |> ui.welcome()
    |> ui.display_board()
  end

  defp take_turn(%{ui: ui, player: player} = config) do
    config
    |> player.move()
    |> ui.display_board()
  end
end
