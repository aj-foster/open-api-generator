defmodule GitHub.ValidationErrorErrors do
  @moduledoc """
  Provides struct and type for a ValidationErrorErrors
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code: String.t(),
          field: String.t() | nil,
          index: integer | nil,
          message: String.t() | nil,
          resource: String.t() | nil,
          value: integer | String.t() | [String.t()] | nil
        }

  defstruct [:__info__, :code, :field, :index, :message, :resource, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      field: {:string, :generic},
      index: :integer,
      message: {:string, :generic},
      resource: {:string, :generic},
      value: {:union, [:integer, {:string, :generic}, [string: :generic], :null]}
    ]
  end
end
