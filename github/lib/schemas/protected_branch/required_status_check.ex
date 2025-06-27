defmodule GitHub.ProtectedBranch.RequiredStatusCheck do
  @moduledoc """
  Provides struct and type for a ProtectedBranch.RequiredStatusCheck
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          checks: [GitHub.ProtectedBranch.RequiredStatusCheckChecks.t()],
          contexts: [String.t()],
          contexts_url: String.t() | nil,
          enforcement_level: String.t() | nil,
          strict: boolean | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :checks, :contexts, :contexts_url, :enforcement_level, :strict, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checks: [{GitHub.ProtectedBranch.RequiredStatusCheckChecks, :t}],
      contexts: [string: :generic],
      contexts_url: {:string, :generic},
      enforcement_level: {:string, :generic},
      strict: :boolean,
      url: {:string, :generic}
    ]
  end
end
