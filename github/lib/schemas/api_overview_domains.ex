defmodule GitHub.ApiOverviewDomains do
  @moduledoc """
  Provides struct and type for a ApiOverviewDomains
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actions: [String.t()] | nil,
          codespaces: [String.t()] | nil,
          copilot: [String.t()] | nil,
          packages: [String.t()] | nil,
          website: [String.t()] | nil
        }

  defstruct [:__info__, :actions, :codespaces, :copilot, :packages, :website]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [string: :generic],
      codespaces: [string: :generic],
      copilot: [string: :generic],
      packages: [string: :generic],
      website: [string: :generic]
    ]
  end
end
