defmodule PrompterTest do
  use ExUnit.Case
  doctest ElixirTicTacToeBasic.Prompter

  describe "#get_input" do
    test "it returns valid user input" do
      input = ElixirTicTacToeBasic.Prompter.get_input(nil, fn _prompt -> "1\n" end)

      assert input == 1
    end

    test "it keeps prompting the user until valid input is received" do
      Helpers.Stack.setup(["abc", "10\n", "-1\n", "1\n"])

      input = ElixirTicTacToeBasic.Prompter.get_input(nil, fn _prompt -> Helpers.Stack.pop end)

      assert input == 1
    end
  end
end

defmodule Helpers.Stack do
  use Agent

  def setup(list) do
    Agent.start_link(fn -> list end, name: __MODULE__)
  end

  def pop() do
    Agent.get_and_update(__MODULE__, fn list ->
      [h | t] = list
      {h, t}
    end)
  end

  def teardown() do
    Agent.stop(__MODULE__)
  end
end
