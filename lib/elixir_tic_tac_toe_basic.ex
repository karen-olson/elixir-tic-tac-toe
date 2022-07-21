defmodule ElixirTicTacToeBasic do
  @moduledoc """
  This module starts the game.
  """

  defstruct [:ui, :player, :outcome_checker]

  def start(config) do
    config
    |> start_game()
    |> play_game()
    |> end_game()
  end

  defp start_game(%{ui: ui} = config) do
    config
    |> ui.welcome()
    |> ui.display_board()
  end

  defp play_game(%{outcome_checker: outcome_checker} = config) do
    config = take_turn(config)

    is_game_over = outcome_checker.is_game_over(config)

    if is_game_over, do: config, else: play_game(config)
  end

  defp take_turn(%{ui: ui, player: player} = config) do
    config
    |> player.move()
    |> ui.display_board()
  end

  defp end_game(%{ui: ui} = config) do
    config
    |> ui.game_over()
  end
end
