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
      detail: {:union, [{:string, :generic}, :null]},
      documentation_url: {:union, [{:string, :generic}, :null]},
      message: {:union, [{:string, :generic}, :null]},
      schemas: [string: :generic],
      scimType: {:union, [{:string, :generic}, :null]},
      status: :integer
    ]
  end
end
