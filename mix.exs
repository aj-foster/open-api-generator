defmodule OpenAPI.MixProject do
  use Mix.Project

  @version "0.0.1-beta.0"
  @source_url "https://github.com/aj-foster/open-api-generator"

  def project do
    [
      app: :open_api,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      name: "OpenAPI Generator",
      source_url: @source_url,
      homepage_url: @source_url,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:eex, :logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:yamerl, "~> 0.10.0"},
      {:yaml_elixir, "~> 2.9"}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md": [title: "Overview"],
        "CODE_OF_CONDUCT.md": [title: "Code of Conduct"],
        "CONTRIBUTING.md": [title: "Contributing"],
        LICENSE: [title: "License"]
      ]
    ]
  end

  defp package do
    [
      description: "Highly-configurable OpenAPI code generator",
      files: [
        "lib",
        "priv",
        "LICENSE",
        "mix.exs",
        "README.md"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      maintainers: ["AJ Foster"]
    ]
  end
end
