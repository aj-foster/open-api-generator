defmodule Klaviyo.ClientErrorErrors do
  @moduledoc """
  Provides struct and type for a ClientErrorErrors
  """

  @type json_resp :: %__MODULE__{
          code: String.t(),
          detail: String.t(),
          id: String.t(),
          source: Klaviyo.ClientErrorErrorsSource.json_resp() | nil,
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
      source: {Klaviyo.ClientErrorErrorsSource, :json_resp},
      title: :string
    ]
  end
end
