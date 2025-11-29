defmodule APIJobErrorPayload do
  @moduledoc """
  Provides struct and type for a APIJobErrorPayload
  """

  @type t :: %__MODULE__{
          code: String.t(),
          detail: String.t(),
          id: String.t(),
          source: ErrorSource.t(),
          title: String.t()
        }

  defstruct [:code, :detail, :id, :source, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      detail: {:string, :generic},
      id: {:string, :generic},
      source: {ErrorSource, :t},
      title: {:string, :generic}
    ]
  end
end
