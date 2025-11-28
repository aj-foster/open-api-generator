defmodule ClientErrorErrors do
  @moduledoc """
  Provides struct and type for a ClientErrorErrors
  """

  @type json_resp :: %__MODULE__{
          code: String.t(),
          detail: String.t(),
          id: String.t(),
          source: ClientErrorErrorsSource.json_resp() | nil,
          title: String.t()
        }

  defstruct [:code, :detail, :id, :source, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      code: {:string, :generic},
      detail: {:string, :generic},
      id: {:string, :generic},
      source: {ClientErrorErrorsSource, :json_resp},
      title: {:string, :generic}
    ]
  end
end
