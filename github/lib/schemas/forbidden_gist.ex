defmodule GitHub.ForbiddenGist do
  @moduledoc """
  Provides struct and type for a ForbiddenGist
  """
  use GitHub.Encoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          block: GitHub.ForbiddenGistBlock.json_resp() | nil,
          documentation_url: String.t() | nil,
          message: String.t() | nil
        }

  defstruct [:__info__, :block, :documentation_url, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      block: {GitHub.ForbiddenGistBlock, :json_resp},
      documentation_url: {:string, :generic},
      message: {:string, :generic}
    ]
  end
end
