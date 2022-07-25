defmodule ElixirTicTacToeBasic.Prompter do
  @moduledoc """
  Prompts the user and returns valid input
  """

  def get_input(state) do
    %{state | current_move: _get_input(state)}
  end

  defp _get_input(state, validated_input \\ nil)

  defp _get_input(%{gets: gets, validator: validator} = state, validated_input)
       when validated_input == :error or validated_input == nil do
    initial_prompt = "Please choose a valid space.\n"

    validated_input = gets.(state, initial_prompt) |> validator.validate()

    _get_input(state, validated_input)
  end

  defp _get_input(_state, validated_input) do
    validated_input
  end
end
