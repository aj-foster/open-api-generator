defmodule GitHub.SearchResultTextMatches do
  @moduledoc """
  Provides struct and type for a SearchResultTextMatches
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          fragment: String.t() | nil,
          matches: [GitHub.SearchResultTextMatchesMatches.t()] | nil,
          object_type: String.t() | nil,
          object_url: String.t() | nil,
          property: String.t() | nil
        }

  defstruct [:__info__, :fragment, :matches, :object_type, :object_url, :property]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fragment: :string,
      matches: [{GitHub.SearchResultTextMatchesMatches, :t}],
      object_type: {:union, [:string, :null]},
      object_url: :string,
      property: :string
    ]
  end
end
