defmodule ElixirTicTacToeBasicTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic

  defmodule TestUI do
    def welcome(state) do
      Map.update(state, :events, ["welcome"], fn events -> ["welcome" | events] end)
    end

    def display_board(state) do
      Map.update(state, :events, ["display board"], fn events -> ["display board" | events] end)
    end
  end

  describe "#start" do
    test "it starts the game" do
      config =
        ElixirTicTacToeBasic.start(%ElixirTicTacToeBasic{
          ui: TestUI
        })

      events = Map.get(config, :events, []) |> Enum.reverse()

      assert events == [
               "welcome",
               "display board"
             ]
    end
  end
end
