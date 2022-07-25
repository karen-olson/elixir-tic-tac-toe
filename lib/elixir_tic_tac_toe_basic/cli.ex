defmodule ElixirTicTacToeBasic.CLI do
  @moduledoc """
  Starts the program.
  """

  def main(_args \\ nil) do
    ElixirTicTacToeBasic.start(%{
      ui: ElixirTicTacToeBasic.UI,
      presenter: ElixirTicTacToeBasic.Presenter,
      prompter: ElixirTicTacToeBasic.Prompter,
      player: ElixirTicTacToeBasic.Player,
      validator: ElixirTicTacToeBasic.Validator,
      outcome_checker: ElixirTicTacToeBasic.OutcomeChecker,
      board: ElixirTicTacToeBasic.Board.new(),
      current_player: nil,
      current_move: nil,
      game_status_log: [],
      gets: fn state, prompt ->
        Map.put(state, :current_move, IO.gets(prompt))
      end
    })
  end
end
