defmodule Klaviyo.ImportErrorResponseObjectResourceAttributes do
  @moduledoc """
  Provides struct and type for a ImportErrorResponseObjectResourceAttributes
  """

  @type t :: %__MODULE__{
          code: String.t(),
          detail: String.t(),
          original_payload: map | nil,
          source: Klaviyo.ErrorSource.t(),
          title: String.t()
        }

  defstruct [:code, :detail, :original_payload, :source, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      detail: :string,
      original_payload: :map,
      source: {Klaviyo.ErrorSource, :t},
      title: :string
    ]
  end
end
