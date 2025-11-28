defmodule GitHub.CodeownersErrorsErrors do
  @moduledoc """
  Provides struct and type for a CodeownersErrorsErrors
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          column: integer,
          kind: String.t(),
          line: integer,
          message: String.t(),
          path: String.t(),
          source: String.t() | nil,
          suggestion: String.t() | nil
        }

  defstruct [:__info__, :column, :kind, :line, :message, :path, :source, :suggestion]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      column: :integer,
      kind: {:string, :generic},
      line: :integer,
      message: {:string, :generic},
      path: {:string, :generic},
      source: {:string, :generic},
      suggestion: {:union, [{:string, :generic}, :null]}
    ]
  end
end
