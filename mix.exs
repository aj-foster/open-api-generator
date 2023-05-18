defmodule OpenAPI.MixProject do
  use Mix.Project

  @version "0.0.6"
  @source_url "https://github.com/aj-foster/open-api-generator"

  def project do
    [
      app: :oapi_generator,
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
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
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
        "LICENSE",
        "mix.exs",
        "README.md"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url, "Sponsor" => "https://github.com/sponsors/aj-foster"},
      maintainers: ["AJ Foster"]
    ]
  end
end
