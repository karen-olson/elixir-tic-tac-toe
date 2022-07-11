defmodule Game do
  @moduledoc """
  Implements protocols according to the Game data type,
  as opposed to the TestGame data type.
  """

  defstruct board: %{
              {0, 0} => 1,
              {0, 1} => 2,
              {0, 2} => 3,
              {1, 0} => 4,
              {1, 1} => 5,
              {1, 2} => 6,
              {2, 0} => 7,
              {2, 1} => 8,
              {2, 2} => 9
            },
            current_player: "X"

  defimpl Console do
    def display_message(game, message) do
      IO.puts(message)
      game
    end

    def display_board(game) do
      formatted_board = Board.format_board(game.board)
      display_message(game, formatted_board)
    end
  end
end
