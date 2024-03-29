defmodule ElixirTicTacToeBasic.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_tic_tac_toe_basic,
      version: "0.1.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      escript: escript(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:rambo, "~> 0.3"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]

  defp elixirc_paths(_), do: ["lib"]

  defp escript do
    [main_module: ElixirTicTacToeBasic.CLI]
  end

  defp aliases do
    [
      test: ["escript.build", "test"]
    ]
  end
end
