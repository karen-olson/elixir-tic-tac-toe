
defmodule TestGame do
  defstruct [
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
    current_player: "X",
    events: []
  ]

  defimpl Console do
    def display_message(game, message) do
      Map.update(game, :events, [], fn events ->
        ["Displayed message, '#{message}'" | events]
      end)
    end

    def display_board(game) do
      Map.update(game, :events, [], fn events ->
        ["Displayed board" | events]
      end)
    end
  end

end
