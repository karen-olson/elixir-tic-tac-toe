defmodule ElixirTicTacToeBasic.Prompter do
  @moduledoc """
  Prompts the user and returns valid input
  """

  def get_input(
        state,
        gets \\ fn state, prompt ->
          Map.put(state, :current_move, IO.gets(prompt))
        end
      )

  def get_input(%{current_move: prev_selection} = state, gets) when prev_selection in 1..9 do
    state
  end

  def get_input(%{current_move: prev_selection} = state, gets) when not is_nil(prev_selection) do
    error_prompt = "Please enter a valid number (1-9).\n"

    gets.(state, error_prompt)
    |> integer_or_error()
    |> get_input(gets)
  end

  def get_input(%{current_move: prev_selection} = state, gets) do
    initial_prompt = "Please choose a space.\n"

    gets.(state, initial_prompt)
    |> integer_or_error()
    |> get_input(gets)
  end

  defp integer_or_error(%{current_move: selection} = state) do
    converted_selection =
      selection
      |> String.trim()
      |> Integer.parse()
      |> extract_integer()

    Map.put(state, :current_move, converted_selection)
  end

  defp extract_integer(selection) do
    if selection == :error, do: selection, else: elem(selection, 0)
  end
end
