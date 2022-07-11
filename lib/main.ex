defmodule Main do
  @moduledoc """
  Plays a Basic Tic Tac Toe Game
  """

  def play(game) do
    game
      |> Console.display_message("Welcome to Tic Tac Toe!")
      |> Console.display_message("Please choose a space (1-9):")
      |> Console.display_board()
  end
end
