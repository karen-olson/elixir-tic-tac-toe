defmodule ElixirTicTacToeBasic.UI do
  @moduledoc """
  Provides a user interface.
  """

  def welcome(
        state,
        callback \\ fn message -> IO.puts(message) && message end
      ) do
    record_message(state, callback.("Welcome to Tic Tac Toe!"))
  end

  def display_board(
        %{presenter: presenter, board: board} = state,
        callback \\ fn message -> IO.puts(message) && message end
      ) do
    record_message(state, callback.(presenter.present(board)))
  end

  def game_over(
        state,
        callback \\ fn message -> IO.puts(message) && message end
      ) do
    record_message(state, callback.("Game over. Thanks for playing. Goodbye!"))
  end

  defp record_message(state, message) do
    Map.update(state, :messages, [message], fn messages ->
      [message | messages]
    end)
  end
end
