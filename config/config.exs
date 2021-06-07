# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :version_release,
  tag_prefix: "v",
  hex_publish: false,
  git_push: true,
  changelog: %{
    creation: :manual,
    replacements: [
      %{file: "CHANGELOG.md", patterns: [
        %{search: "Unreleased", replace: "{{version}}"},
        %{search: "...HEAD", replace: "...{{tag_name}}", global: false},
        %{search: "ReleaseDate", replace: "{{date}}"},
        %{search: "<!-- next-header -->", replace: "<!-- next-header -->\n\n## [Unreleased] - ReleaseDate", global: false},
        %{search: "<!-- next-url -->", replace: "<!-- next-url -->\n[Unreleased]: https://github.com/bulld0zer/elixir-version-release-tests/compare/{{tag_name}}...HEAD", global: false}
      ]}
    ]
  },
  merge: %{
    ignore_confligs: true,
    branches: [
      %{from: "master", to: ["develop", "edge"], strategy: "resolve"},
      %{from: "develop", to: ["edge", "edge2"], strategy: ["recursive", "--strategy-option", "theirs"]},
      %{from: "alpha", to: ["develop"]}
    ]
  },
  commit_message: "[version_release] {{message}}"
