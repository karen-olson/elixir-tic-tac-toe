defmodule Main do
  @moduledoc """
  Plays a Basic Tic Tac Toe Game
  """

  def play(game) do
    game
    |> Ui.start_game()
  end
end
