defmodule AcceptanceTest do
  use ExUnit.Case

  describe "acceptance" do
    test "the game works when run from the command line" do
      {_status, %Rambo{out: output}} =
        Rambo.run("./elixir_tic_tac_toe_basic",
          in: ["1\n", "2\n", "3\n", "4\n", "5\n", "6\n", "7\n", "8\n", "9\n"]
        )

      full_board = """
       x | o | x
      ---+---+---
       o | x | o
      ---+---+---
       x | o | x
      """

      output = String.downcase(output)

      assert String.contains?(output, "welcome")
      assert String.contains?(output, full_board)
    end
  end
end
