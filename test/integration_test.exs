defmodule IntegrationTest do
  use ExUnit.Case

  describe "integration" do
    test "it plays the game" do
      user_input = ["5\n", "1\n"]

      Helpers.Stack.setup(user_input)

      %{messages: messages} =
        ElixirTicTacToeBasic.start(%{
          ui: ElixirTicTacToeBasic.UI,
          presenter: ElixirTicTacToeBasic.Presenter,
          prompter: ElixirTicTacToeBasic.Prompter,
          player: ElixirTicTacToeBasic.Player,
          validator: ElixirTicTacToeBasic.Validator,
          board: ElixirTicTacToeBasic.Board.new(),
          current_player: nil,
          current_move: nil,
          gets: fn state, _prompt ->
            Map.put(state, :current_move, Helpers.Stack.pop())
          end
        })

      empty_board = """
       1 | 2 | 3
      ---+---+---
       4 | 5 | 6
      ---+---+---
       7 | 8 | 9
      """

      board_with_first_move = """
       1 | 2 | 3
      ---+---+---
       4 | X | 6
      ---+---+---
       7 | 8 | 9
      """

      board_with_second_move = """
       O | 2 | 3
      ---+---+---
       4 | X | 6
      ---+---+---
       7 | 8 | 9
      """

      messages = Enum.reverse(messages)

      assert messages == [
               "Welcome to Tic Tac Toe!",
               empty_board,
               board_with_first_move,
               board_with_second_move
             ]

      Helpers.Stack.teardown()
    end
  end
end
