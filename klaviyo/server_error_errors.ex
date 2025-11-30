defmodule Klaviyo.ServerErrorErrors do
  @moduledoc """
  Provides struct and type for a ServerErrorErrors
  """

  @type json_resp :: %__MODULE__{
          code: String.t(),
          detail: String.t(),
          id: String.t(),
          source: Klaviyo.ServerErrorErrorsSource.json_resp() | nil,
          title: String.t()
        }

  defstruct [:code, :detail, :id, :source, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      code: :string,
      detail: :string,
      id: :string,
      source: {Klaviyo.ServerErrorErrorsSource, :json_resp},
      title: :string
    ]
  end
end
