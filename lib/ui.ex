defmodule Ui do
  @moduledoc """
  Encapsulates user interactions
  """

  def start_game(game) do
    game
    |> Console.display_message("Welcome to Tic Tac Toe!")
    |> Console.display_message("Please choose a space (1-9):")
    |> Console.display_board()
  end
end
