defmodule Helpers.Stack do
  @moduledoc """
  This module provides functions to help mock user input for testing purposes.
  Credit for this module goes to Lucas PenzeyMoog's blog post "Mock User Input for Integration Tests in Elixir/ExUnit" (https://medium.com/@lucaspenzeymoog/mock-user-input-for-integration-tests-in-elixir-exunit-a7f179fdfc53)
  """

  use Agent

  def setup(list) do
    Agent.start_link(fn -> list end, name: __MODULE__)
  end

  def pop() do
    Agent.get_and_update(__MODULE__, fn list ->
      [head | tail] = list
      {head, tail}
    end)
  end

  def teardown() do
    Agent.stop(__MODULE__)
  end
end
