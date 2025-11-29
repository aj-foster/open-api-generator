defmodule GitHub.Branch.RestrictionPolicyAppsPermissions do
  @moduledoc """
  Provides struct and type for a Branch.RestrictionPolicyAppsPermissions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          contents: String.t() | nil,
          issues: String.t() | nil,
          metadata: String.t() | nil,
          single_file: String.t() | nil
        }

  defstruct [:__info__, :contents, :issues, :metadata, :single_file]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      contents: {:string, :generic},
      issues: {:string, :generic},
      metadata: {:string, :generic},
      single_file: {:string, :generic}
    ]
  end
end
