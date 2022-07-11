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

  def format_board(board) do
    """
     #{board[{0, 0}]} | #{board[{0, 1}]} | #{board[{0, 2}]}
    ---+---+---
     #{board[{1, 0}]} | #{board[{1, 1}]} | #{board[{1, 2}]}
    ---+---+---
     #{board[{2, 0}]} | #{board[{2, 1}]} | #{board[{2, 2}]}
    """
  end

  defimpl Console do
    def display_message(game, message) do
      IO.puts(message)
      game
    end

    def display_board(game) do
      board = game.board
      formatted_board = Game.format_board(board)
      display_message(game, formatted_board)
    end
  end
end
