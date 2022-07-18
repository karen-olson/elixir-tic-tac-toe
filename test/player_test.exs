defmodule PlayerTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Player

  defmodule PlayerTest.TestPrompter do
    def get_input(state, _gets) do
      Map.put(state, :current_move, 5)
    end
  end

  describe "#move" do
    test "it places a mark in the player's selected space" do
      state = %{
        prompter: PlayerTest.TestPrompter,
        board: ElixirTicTacToeBasic.Board.new(),
        current_move: nil,
        current_player: nil,
        gets: nil
      }

      board_with_first_move = %{
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

      %{board: board} = ElixirTicTacToeBasic.Player.move(state)

      assert board == board_with_first_move
    end

    test "it switches to the correct player at the beginning of the turn" do
      state = %{
        prompter: PlayerTest.TestPrompter,
        board: ElixirTicTacToeBasic.Board.new(),
        current_move: nil,
        current_player: "X",
        gets: nil
      }

      board_with_o_marker = %{
        1 => 1,
        2 => 2,
        3 => 3,
        4 => 4,
        5 => "O",
        6 => 6,
        7 => 7,
        8 => 8,
        9 => 9
      }

      %{board: board} = ElixirTicTacToeBasic.Player.move(state)

      assert board == board_with_o_marker
    end

    test "it resets the current move in state at the end of the turn" do
      state = %{
        prompter: PlayerTest.TestPrompter,
        board: ElixirTicTacToeBasic.Board.new(),
        current_move: nil,
        current_player: nil,
        gets: fn state, prompt ->
          Map.put(state, :current_move, IO.gets(prompt))
        end
      }

      %{current_move: current_move} = ElixirTicTacToeBasic.Player.move(state)

      assert current_move == nil
    end
  end
end
