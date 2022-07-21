defmodule ElixirTicTacToeBasic do
  @moduledoc """
  This module starts the game.
  """

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

  defp play_game(config, game_status \\ :in_progress)

  defp play_game(config, game_status) when game_status == :game_over do
    config
  end

  defp play_game(%{outcome_checker: outcome_checker} = config, game_status)
       when game_status == :in_progress do
    config =
      config
      |> take_turn()
      |> outcome_checker.game_status()

    game_status = get_game_status(config)

    play_game(config, game_status)
  end

  defp take_turn(%{ui: ui, player: player} = config) do
    config
    |> player.move()
    |> ui.display_board()
  end

  defp get_game_status(config) do
    %{game_status_log: game_status_log} = config
    [game_status | _log] = game_status_log
    game_status
  end

  defp end_game(%{ui: ui} = config) do
    config
    |> ui.game_over()
  end
end
