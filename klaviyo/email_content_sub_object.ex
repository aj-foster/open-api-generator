defmodule Klaviyo.EmailContentSubObject do
  @moduledoc """
  Provides struct and type for a EmailContentSubObject
  """

  @type t :: %__MODULE__{
          bcc_email: String.t() | nil,
          cc_email: String.t() | nil,
          from_email: String.t() | nil,
          from_label: String.t() | nil,
          preview_text: String.t() | nil,
          reply_to_email: String.t() | nil,
          subject: String.t() | nil
        }

  defstruct [
    :bcc_email,
    :cc_email,
    :from_email,
    :from_label,
    :preview_text,
    :reply_to_email,
    :subject
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bcc_email: :string,
      cc_email: :string,
      from_email: :string,
      from_label: :string,
      preview_text: :string,
      reply_to_email: :string,
      subject: :string
    ]
  end
end
