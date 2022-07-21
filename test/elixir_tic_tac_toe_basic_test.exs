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
      Map.update(state, :events, ["game_over"], fn events -> ["game_over" | events] end)
    end
  end

  defmodule TestPlayer do
    def move(state) do
      Map.update(state, :events, [], fn events -> ["player moves" | events] end)
    end
  end

  defmodule TestOutcomeChecker do
    def is_game_over(_config) do
      Helpers.Stack.pop()
    end
  end

  describe "#start" do
    test "it starts the game" do
      is_game_over = [false, false, true]
      Helpers.Stack.setup(is_game_over)

      config =
        ElixirTicTacToeBasic.start(%ElixirTicTacToeBasic{
          ui: TestUI,
          player: TestPlayer,
          outcome_checker: TestOutcomeChecker
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

      Helpers.Stack.teardown()
    end
  end
end
