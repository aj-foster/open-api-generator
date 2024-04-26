defmodule OpenAPI.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/aj-foster/open-api-generator"

  def project do
    [
      app: :oapi_generator,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
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
        "guides/configuration.md": [title: "Configuration"],
        "guides/plugins.md": [title: "Plugins"],
        "guides/client-author-guide.md": [title: "Client Author Guide"],
        "CODE_OF_CONDUCT.md": [title: "Code of Conduct"],
        "CONTRIBUTING.md": [title: "Contributing"],
        LICENSE: [title: "License"]
      ],
      groups_for_extras: [
        Guides: ~r/guides\/.*/
      ],
      groups_for_functions: [
        "Default Implementations": & &1[:default_implementation]
      ],
      groups_for_modules: [
        Reader: ~r/OpenAPI.Reader/,
        Processor: ~r/OpenAPI.Processor/,
        Renderer: ~r/OpenAPI.Renderer/,
        Specification: ~r/OpenAPI.Spec/
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      description: "Highly-configurable OpenAPI code generator",
      files: [
        "guides",
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
