defmodule VersionReleaseTests.MixProject do
  use Mix.Project

  def project do
    [
      app: :version_release_tests,
      version: "0.0.7-beta.1",
      elixir: "~> 1.8",
      elixirc_paths: ["lib"],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:version_release, path: "../elixir-version-release", only: :dev, runtime: false}
    ]
  end
end
