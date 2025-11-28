defmodule GitHub.Dependabot.Alert.Dependency do
  @moduledoc """
  Provides struct and type for a Dependabot.Alert.Dependency
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          manifest_path: String.t() | nil,
          package: GitHub.Dependabot.Alert.Package.t() | nil,
          scope: String.t() | nil
        }

  defstruct [:__info__, :manifest_path, :package, :scope]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      manifest_path: {:string, :generic},
      package: {GitHub.Dependabot.Alert.Package, :t},
      scope: {:enum, ["development", "runtime", nil]}
    ]
  end
end
