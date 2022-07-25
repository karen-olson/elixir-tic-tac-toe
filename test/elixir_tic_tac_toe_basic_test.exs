defmodule ElixirTicTacToeBasicTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic

  defmodule TestUI do
    def welcome(state) do
      Map.update(state, :events, ["welcome"], fn events -> ["welcome" | events] end)
    end

    def display_board(state) do
      Map.update(state, :events, [], fn events -> ["display board" | events] end)
    end

    def game_over(state) do
      Map.update(state, :events, [], fn events -> ["game_over" | events] end)
    end
  end

  defmodule TestPlayer do
    def move(state) do
      Map.update(state, :events, [], fn events -> ["player moves" | events] end)
    end
  end

  defmodule TestOutcomeChecker do
    def game_status(%{game_status_log: game_status_log} = config)
        when length(game_status_log) < 2 do
      Map.update(config, :game_status_log, [:in_progress], fn game_status_log ->
        [:in_progress | game_status_log]
      end)
    end

    def game_status(%{game_status_log: game_status_log} = config)
        when length(game_status_log) == 2 do
      Map.update(config, :game_status_log, [], fn game_status_log ->
        [:game_over | game_status_log]
      end)
    end
  end

  describe "#start" do
    test "it runs the game" do
      config =
        ElixirTicTacToeBasic.start(%{
          ui: TestUI,
          player: TestPlayer,
          outcome_checker: TestOutcomeChecker,
          game_status_log: []
        })

      %{events: events} = config
      events = Enum.reverse(events)

      assert events == [
               "welcome",
               "display board",
               "player moves",
               "display board",
               "player moves",
               "display board",
               "player moves",
               "display board",
               "game_over"
             ]
    end
  end
end
