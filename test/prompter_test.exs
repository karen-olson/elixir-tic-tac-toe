defmodule PrompterTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Prompter

  describe "#get_input" do
    test "it stores valid input in state" do
      user_input = "1\n"

      state = %{
        current_move: nil,
        board: ElixirTicTacToeBasic.Board.new(),
        gets: fn state, _prompt ->
          Map.put(state, :current_move, user_input)
        end
      }

      %{current_move: current_move} = ElixirTicTacToeBasic.Prompter.get_input(state)

      assert current_move == 1
    end

    test "it keeps prompting the user until valid input is received" do
      user_input = ["abc", "10\n", "-1\n", "5\n", "1\n"]
      Helpers.Stack.setup(user_input)

      state = %{
        current_move: nil,
        board: %{
          1 => 1,
          2 => 2,
          3 => 3,
          4 => 4,
          5 => "X",
          6 => 6,
          7 => 7,
          8 => 8,
          9 => 9
        },
        gets: fn state, _prompt ->
          Map.put(state, :current_move, Helpers.Stack.pop())
        end
      }

      %{current_move: current_move} = ElixirTicTacToeBasic.Prompter.get_input(state)

      assert current_move == 1

      Helpers.Stack.teardown()
    end
  end
end
