defmodule ElixirTicTacToeBasic.Player do
  @moduledoc """
  This module provides functions for making moves in the game.
  """

  def move(%{prompter: prompter, gets: gets} = state) do
    state
    |> set_current_player()
    |> prompter.get_input(gets)
    |> update_board()
    |> reset_current_move()
  end

  defp set_current_player(state) do
    Map.update(state, :current_player, "X", fn current_player ->
      if current_player == nil or current_player == "O", do: "X", else: "O"
    end)
  end

  defp update_board(
         %{board: board, current_move: current_move, current_player: current_player} = state
       ) do
    Map.update(state, :board, board, fn board ->
      Map.put(board, current_move, current_player)
    end)
  end

  defp reset_current_move(state) do
    Map.put(state, :current_move, nil)
  end
end
