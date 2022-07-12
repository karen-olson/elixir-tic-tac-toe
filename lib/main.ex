defmodule Main do
  @moduledoc """
  This module plays the game.
  """

  def play(game) do
    game
    |> Ui.start_game()
  end
end
