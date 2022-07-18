defmodule PrompterTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Prompter

  describe "#get_input" do
    test "it stores valid input in state" do
      state = %{
        current_move: nil,
        board: ElixirTicTacToeBasic.Board.new()
      }

      user_input = "1\n"

      %{current_move: current_move} =
        ElixirTicTacToeBasic.Prompter.get_input(state, fn _state, _prompt ->
          Map.put(state, :current_move, user_input)
        end)

      assert current_move == 1
    end

    test "it keeps prompting the user until valid input is received" do
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
        }
      }

      user_input = ["abc", "10\n", "-1\n", "5\n", "1\n"]

      Helpers.Stack.setup(user_input)

      %{current_move: current_move} =
        ElixirTicTacToeBasic.Prompter.get_input(state, fn _state, _prompt ->
          Map.put(state, :current_move, Helpers.Stack.pop())
        end)

      assert current_move == 1

      Helpers.Stack.teardown()
    end

    test "it uses the correct prompt for the situation (error or not)" do
      state = %{
        messages: [],
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
        }
      }

      user_input = ["abc", "10\n", "-1\n", "5\n", "1\n"]

      Helpers.Stack.setup(user_input)

      %{messages: messages, current_move: current_move} =
        ElixirTicTacToeBasic.Prompter.get_input(state, fn state, prompt ->
          Map.put(state, :current_move, Helpers.Stack.pop())
          |> record_message(prompt)
        end)

      assert current_move == 1

      messages = Enum.reverse(messages)

      assert messages == [
               "Please choose a space.\n",
               "Please enter a valid number (1-9).\n",
               "Please enter a valid number (1-9).\n",
               "Please enter a valid number (1-9).\n",
               "Please enter a valid number (1-9).\n"
             ]

      Helpers.Stack.teardown()
    end
  end

  defp record_message(state, message) do
    Map.update(state, :messages, [], fn messages ->
      [message | messages]
    end)
  end
end
