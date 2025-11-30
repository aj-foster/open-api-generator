defmodule Klaviyo.APIJobErrorPayload do
  @moduledoc """
  Provides struct and type for a APIJobErrorPayload
  """

  @type t :: %__MODULE__{
          code: String.t(),
          detail: String.t(),
          id: String.t(),
          source: Klaviyo.ErrorSource.t(),
          title: String.t()
        }

  defstruct [:code, :detail, :id, :source, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      detail: :string,
      id: :string,
      source: {Klaviyo.ErrorSource, :t},
      title: :string
    ]
  end
end
