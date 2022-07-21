defmodule OutcomeCheckerTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.OutcomeChecker

  test "it correctly logs the status when the game is over" do
    config_with_full_board = %{
      board: %{
        1 => "X",
        2 => "O",
        3 => "X",
        4 => "O",
        5 => "X",
        6 => "O",
        7 => "X",
        8 => "O",
        9 => "X"
      },
      game_status_log: [
        :in_progress,
        :in_progress,
        :in_progress,
        :in_progress,
        :in_progress,
        :in_progress,
        :in_progress,
        :in_progress
      ]
    }

    %{game_status_log: game_status_log} =
      ElixirTicTacToeBasic.OutcomeChecker.game_status(config_with_full_board)

    assert game_status_log == [
             :game_over,
             :in_progress,
             :in_progress,
             :in_progress,
             :in_progress,
             :in_progress,
             :in_progress,
             :in_progress,
             :in_progress
           ]
  end

  test "it correctly logs the status when the game is in progress" do
    config_with_empty_board = %{
      board: %{
        1 => 1,
        2 => 2,
        3 => 3,
        4 => 4,
        5 => 5,
        6 => 6,
        7 => 7,
        8 => 8,
        9 => 9
      },
      game_status_log: []
    }

    %{game_status_log: game_status_log} =
      ElixirTicTacToeBasic.OutcomeChecker.game_status(config_with_empty_board)

    assert game_status_log == [:in_progress]
  end
end
