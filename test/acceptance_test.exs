defmodule AcceptanceTest do
  use ExUnit.Case

  describe "acceptance" do
    test "the game works when run from the command line" do
      {status, %Rambo{out: output}} = Rambo.run("./elixir_tic_tac_toe_basic", in: "5\n")

      output = String.downcase(output)

      assert String.contains?(output, "welcome")
      assert String.contains?(output, "4 | x | 6")
    end
  end
end
