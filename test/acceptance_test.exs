defmodule AcceptanceTest do
  use ExUnit.Case

  describe "acceptance" do
    test "the game works when run from the command line" do
      {_status, %Rambo{out: output}} = Rambo.run("./elixir_tic_tac_toe_basic", in: ["5\n", "9\n"])

      output = String.downcase(output)

      assert String.contains?(output, "welcome")
      assert String.contains?(output, "4 | x | 6")
      assert String.contains?(output, "7 | 8 | o")
    end
  end
end
