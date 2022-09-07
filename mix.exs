defmodule OpenAPI.MixProject do
  use Mix.Project

  def project do
    [
      app: :open_api,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:eex, :logger]
    ]
  end

  defp deps do
    [
      {:yamerl, "~> 0.10.0"}
    ]
  end
end
