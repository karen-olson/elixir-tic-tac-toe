defmodule IntegrationTest do
  use ExUnit.Case

  describe "integration" do
    test "it plays the game until the board is full" do
      user_input = ["8\n", "9\n"]

      Helpers.Stack.setup(user_input)

      board_with_two_empty_spaces = %{
        1 => "O",
        2 => "X",
        3 => "O",
        4 => "X",
        5 => "O",
        6 => "X",
        7 => "O",
        8 => 8,
        9 => 9
      }

      %{messages: messages} =
        ElixirTicTacToeBasic.start(%{
          ui: ElixirTicTacToeBasic.UI,
          presenter: ElixirTicTacToeBasic.Presenter,
          prompter: ElixirTicTacToeBasic.Prompter,
          player: ElixirTicTacToeBasic.Player,
          validator: ElixirTicTacToeBasic.Validator,
          outcome_checker: ElixirTicTacToeBasic.OutcomeChecker,
          board: board_with_two_empty_spaces,
          current_player: nil,
          current_move: nil,
          game_status_log: [],
          gets: fn state, _prompt ->
            Map.put(state, :current_move, Helpers.Stack.pop())
          end
        })

      board = """
       O | X | O
      ---+---+---
       X | O | X
      ---+---+---
       O | 8 | 9
      """

      board_with_x_move = """
       O | X | O
      ---+---+---
       X | O | X
      ---+---+---
       O | X | 9
      """

      full_board = """
       O | X | O
      ---+---+---
       X | O | X
      ---+---+---
       O | X | O
      """

      messages = Enum.reverse(messages)

      assert messages == [
               "Welcome to Tic Tac Toe!",
               board,
               board_with_x_move,
               full_board,
               "Game over. Thanks for playing. Goodbye!"
             ]

      Helpers.Stack.teardown()
    end
  end
end
