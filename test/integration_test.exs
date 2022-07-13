defmodule IntegrationTest do
  use ExUnit.Case

  describe "integration" do
    test "it plays the game" do
      %{messages: messages} = ElixirTicTacToeBasic.CLI.main()

      empty_board = """
       1 | 2 | 3
      ---+---+---
       4 | 5 | 6
      ---+---+---
       7 | 8 | 9
      """

      assert messages == [
               "Welcome to Tic Tac Toe!",
               empty_board
             ]
    end
  end
end
