defmodule TimeAgoWords.Mixfile do
  use Mix.Project

  def project do
    [
      app: :time_ago_words,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      description: description,
      package: package
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :timex]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:timex, "~> 2.1"},
      {:shouldi, "~> 0.3.0", only: :test}
    ]
  end

  defp description do
    """
    A simple function to return the approximate difference between two times using words.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
      maintainers: ["Chris Blackburn"],
      licenses: ["MIT"],
      links: %{"GitHub": "https://github.com/midwire/time_ago_words"}
    ]
  end
end
