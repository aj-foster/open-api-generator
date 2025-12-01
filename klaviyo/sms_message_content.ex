defmodule Klaviyo.SMSMessageContent do
  @moduledoc """
  Provides struct and type for a SMSMessageContent
  """

  @type t :: %__MODULE__{body: String.t(), media_url: String.t() | nil}

  defstruct [:body, :media_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [body: :string, media_url: :string]
  end
end
