defmodule PrompterTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Prompter

  defmodule TestValidatorReturnsValidSelection do
    def validate(_state) do
      1
    end
  end

  defmodule TestValidatorReturnsErrorThenValidSelection do
    def validate(_state) do
      Helpers.Stack.pop()
    end
  end

  describe "#get_input" do
    test "it stores valid input in state" do
      user_input = "1\n"

      state = %{
        current_move: nil,
        board: ElixirTicTacToeBasic.Board.new(),
        validator: PrompterTest.TestValidatorReturnsValidSelection,
        gets: fn state, _prompt ->
          Map.put(state, :current_move, user_input)
        end
      }

      %{current_move: current_move} = ElixirTicTacToeBasic.Prompter.get_input(state)

      assert current_move == 1
    end

    test "it keeps prompting the user until valid input is received" do
      validated_input = [:error, 1]
      Helpers.Stack.setup(validated_input)

      state = %{
        current_move: nil,
        board: ElixirTicTacToeBasic.Board.new(),
        validator: PrompterTest.TestValidatorReturnsErrorThenValidSelection,
        gets: fn state, _prompt ->
          %{state | current_move: "invalid selection"}
        end
      }

      %{current_move: current_move} = ElixirTicTacToeBasic.Prompter.get_input(state)

      assert current_move == 1

      Helpers.Stack.teardown()
    end
  end
end
