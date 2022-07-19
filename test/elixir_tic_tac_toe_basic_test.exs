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
  end

  defmodule TestPlayer do
    def move(state) do
      Map.update(state, :events, [], fn events -> ["player moves" | events] end)
    end
  end

  describe "#start" do
    test "it starts the game" do
      config =
        ElixirTicTacToeBasic.start(%ElixirTicTacToeBasic{
          ui: TestUI,
          player: TestPlayer
        })

      %{events: events} = config
      events = Enum.reverse(events)

      assert events == [
               "welcome",
               "display board",
               "player moves",
               "display board",
               "player moves",
               "display board"
             ]
    end
  end
end
