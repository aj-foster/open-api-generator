defmodule GitHub.ValidationError do
  @moduledoc """
  Provides struct and types for a ValidationError
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{
          __info__: map,
          documentation_url: String.t(),
          errors: [String.t()] | nil,
          message: String.t()
        }

  @type t :: %__MODULE__{
          __info__: map,
          documentation_url: String.t(),
          errors: [GitHub.ValidationErrorErrors.t()] | nil,
          message: String.t()
        }

  defstruct [:__info__, :documentation_url, :errors, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:simple) do
    [
      documentation_url: {:string, :generic},
      errors: [string: :generic],
      message: {:string, :generic}
    ]
  end

  def __fields__(:t) do
    [
      documentation_url: {:string, :generic},
      errors: [{GitHub.ValidationErrorErrors, :t}],
      message: {:string, :generic}
    ]
  end
end
