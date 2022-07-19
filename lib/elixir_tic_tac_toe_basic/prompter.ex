defmodule ElixirTicTacToeBasic.Prompter do
  @moduledoc """
  Prompts the user and returns valid input
  """

  def get_input(state) do
    %{state | current_move: _get_input(state)}
  end

  defp _get_input(%{gets: gets, validator: validator} = state) do
    initial_prompt = "Please choose a valid space.\n"

    validated_input = gets.(state, initial_prompt) |> validator.validate()

    case validated_input do
      :error -> _get_input(state)
      selection -> selection
    end
  end
end
