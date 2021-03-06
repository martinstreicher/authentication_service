defmodule SessionService.Mixfile do
  use Mix.Project

  def project do
    [
      aliases:    aliases(),
      app:        :session_service,
      build_embedded: Mix.env == :prod,
      compilers:  [:phoenix, :gettext] ++ Mix.compilers,
      deps:       deps(),
      elixir:     "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      version:    "0.0.1" ]
  end

  #
  # Configuration for the OTP application.
  # Type `mix help compile.app` for more information.
  def application do
    [
      applications: [
        :cowboy,
        :gettext,
        :logger,
        :phoenix,
        :phoenix_ecto,
        :phoenix_html,
        :phoenix_pubsub,
        :postgrex ],
      mod: { SessionService, [] } ]
  end

  #
  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  #
  # Specifies your project dependencies.
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:exredis, ">= 0.2.4"},
      {:gettext, "~> 0.11"},
      {:guardian, "~> 0.12.0"},
      {:guardian_db, "~> 0.7.0"},
      {:hound, "~> 1.0"},
      {:jose, "~> 1.7"},
      {:phoenix, "~> 1.2.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_pubsub, "~> 1.0"},
      {:poison, "~> 2.2"},
      {:postgrex, ">= 0.0.0"} ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test":       ["ecto.create --quiet", "ecto.migrate", "test"] ]
  end
end
