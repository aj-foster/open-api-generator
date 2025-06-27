defmodule FieldEmbedModelConfig do
  @moduledoc """
  Provides struct and type for a FieldEmbedModelConfig
  """

  @type t :: %__MODULE__{
          access_token: String.t() | nil,
          api_key: String.t() | nil,
          client_id: String.t() | nil,
          client_secret: String.t() | nil,
          model_name: String.t(),
          project_id: String.t() | nil
        }

  defstruct [:access_token, :api_key, :client_id, :client_secret, :model_name, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_token: {:string, :generic},
      api_key: {:string, :generic},
      client_id: {:string, :generic},
      client_secret: {:string, :generic},
      model_name: {:string, :generic},
      project_id: {:string, :generic}
    ]
  end
end
