defmodule UITest do
  use ExUnit.Case
  alias ElixirTicTacToeBasic.UI

  describe "#welcome/1" do
    test "it welcomes the user" do
      %{messages: messages} = UI.welcome(%{}, fn message -> String.upcase(message) end)

      assert Enum.reverse(messages) == ["WELCOME TO TIC TAC TOE!"]
    end

    test "it welcomes the user multiple times in a row" do
      %{messages: messages} =
        %{}
        |> UI.welcome(fn message -> String.upcase(message) end)
        |> UI.welcome(fn message -> String.downcase(message) end)

      assert Enum.reverse(messages) == ["WELCOME TO TIC TAC TOE!", "welcome to tic tac toe!"]
    end
  end

  describe "#display_board/1" do
    defmodule TestPresenter do
      def present(board) do
        board
      end
    end

    test "it shows the board" do
      board = "BOARD"
      callback = &String.upcase(&1)

      %{messages: messages} =
        %{presenter: TestPresenter, board: board}
        |> UI.display_board(callback)

      assert Enum.reverse(messages) == ["BOARD"]
    end

    test "it displays the board multiple times in a row" do
      board = "BOARD"

      %{messages: messages} =
        %{presenter: TestPresenter, board: board}
        |> UI.display_board(fn message -> String.upcase(message) end)
        |> UI.display_board(fn message -> String.downcase(message) end)

      assert Enum.reverse(messages) == ["BOARD", "board"]
    end
  end

  describe "#game_over/1" do
    test "it shows the user a game over message" do
      %{messages: messages} = UI.game_over(%{}, fn message -> String.upcase(message) end)

      assert Enum.reverse(messages) == ["GAME OVER. THANKS FOR PLAYING. GOODBYE!"]
    end

    test "it shows the game over message multiple times in a row" do
      %{messages: messages} =
        %{}
        |> UI.game_over(fn message -> String.upcase(message) end)
        |> UI.game_over(fn message -> String.downcase(message) end)

      assert Enum.reverse(messages) == [
               "GAME OVER. THANKS FOR PLAYING. GOODBYE!",
               "game over. thanks for playing. goodbye!"
             ]
    end
  end
end
