defmodule GitHub.Actions.Runner.Application do
  @moduledoc """
  Provides struct and type for a Actions.Runner.Application
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          architecture: String.t(),
          download_url: String.t(),
          filename: String.t(),
          os: String.t(),
          sha256_checksum: String.t() | nil,
          temp_download_token: String.t() | nil
        }

  defstruct [
    :__info__,
    :architecture,
    :download_url,
    :filename,
    :os,
    :sha256_checksum,
    :temp_download_token
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      architecture: {:string, :generic},
      download_url: {:string, :generic},
      filename: {:string, :generic},
      os: {:string, :generic},
      sha256_checksum: {:string, :generic},
      temp_download_token: {:string, :generic}
    ]
  end
end
