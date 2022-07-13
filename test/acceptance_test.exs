defmodule AcceptanceTest do
  use ExUnit.Case

  describe "acceptance" do
    test "the game works when run from the command line" do
      Mix.Shell.Process.cmd("mix escript.build")
      Mix.Shell.Process.cmd("./elixir_tic_tac_toe_basic")

      assert_received {_, _, ["Welcome to Tic Tac Toe!\n"]}
      assert_received {_, _, [_empty_board]}

      Mix.Shell.Process.flush()
    end
  end
end
