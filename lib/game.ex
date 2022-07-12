defmodule Game do
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

  defimpl Ui do
    def start_game(game) do
      game
      |> Console.display_message("\nWelcome to Tic Tac Toe!\n")
      |> Console.display_message("Please choose a space (1-9):\n")
      |> Console.display_board()
    end
  end

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
