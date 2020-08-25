defmodule VersionReleaseTests.MixProject do
  use Mix.Project

  def project do
    [
      app: :version_release_tests,
      version: "1.0.1-alpha.5",
      elixir: "~> 1.8",
      description: "Tests for version_release",
      package: [
        name: "version_release_tests",
        files: ~w(lib mix.exs README* CHANGELOG*),
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/bulld0zer/elixir-version-release-tests"}
      ],
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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:version_release, path: "../elixir-version-release", only: :dev, runtime: false}
    ]
  end
end
