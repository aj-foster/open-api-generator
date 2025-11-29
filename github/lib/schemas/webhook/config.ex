defmodule GitHub.Webhook.Config do
  @moduledoc """
  Provides struct and type for a Webhook.Config
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          content_type: String.t() | nil,
          insecure_ssl: number | String.t() | nil,
          secret: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :content_type, :insecure_ssl, :secret, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_type: {:string, :generic},
      insecure_ssl: {:union, [:number, string: :generic]},
      secret: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
