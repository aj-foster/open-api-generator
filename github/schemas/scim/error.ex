defmodule GitHub.SCIM.Error do
  @moduledoc """
  Provides struct and type for a SCIM.Error
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          detail: String.t() | nil,
          documentation_url: String.t() | nil,
          message: String.t() | nil,
          schemas: [String.t()] | nil,
          scimType: String.t() | nil,
          status: integer | nil
        }

  defstruct [:__info__, :detail, :documentation_url, :message, :schemas, :scimType, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      detail: {:union, [:string, :null]},
      documentation_url: {:union, [:string, :null]},
      message: {:union, [:string, :null]},
      schemas: [:string],
      scimType: {:union, [:string, :null]},
      status: :integer
    ]
  end
end
