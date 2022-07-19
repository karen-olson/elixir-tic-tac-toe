defmodule ValidatorTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Validator

  describe "validate" do
    test "when input is valid, it returns the selection" do
      state = %{
        current_move: "1\n",
        board: ElixirTicTacToeBasic.Board.new()
      }

      selection = ElixirTicTacToeBasic.Validator.validate(state)

      assert selection == 1
    end

    test "when input is not a valid number, it returns :error" do
      state = %{
        current_move: "asdf\n",
        board: ElixirTicTacToeBasic.Board.new()
      }

      selection = ElixirTicTacToeBasic.Validator.validate(state)

      assert selection == :error
    end

    test "when input corresponds to an unavailable space, it returns :error" do
      state = %{
        current_move: "1\n",
        board: %{
          1 => "X",
          2 => 2,
          3 => 3,
          4 => 4,
          5 => 5,
          6 => 6,
          7 => 7,
          8 => 8,
          9 => 9
        }
      }

      selection = ElixirTicTacToeBasic.Validator.validate(state)

      assert selection == :error
    end
  end
end
