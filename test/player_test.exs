defmodule PlayerTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Player

  defmodule TestPrompter do
    def get_input do
      {1, 1}
    end
  end

  describe "#move" do
    test "it places a mark in the player's selected space" do
      state = %{
        board: %{
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
        prompter: PlayerTest.TestPrompter,
        current_player: "X"
      }

      board_with_first_move = %{
        {0, 0} => 1,
        {0, 1} => 2,
        {0, 2} => 3,
        {1, 0} => 4,
        {1, 1} => "X",
        {1, 2} => 6,
        {2, 0} => 7,
        {2, 1} => 8,
        {2, 2} => 9
      }

      %{board: board} = ElixirTicTacToeBasic.Player.move(state)

      assert board == board_with_first_move
    end
  end
end
