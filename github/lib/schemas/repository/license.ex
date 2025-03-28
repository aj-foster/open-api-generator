defmodule GitHub.Repository.License do
  @moduledoc """
  Provides struct and type for a Repository.License
  """
  use GitHub.Encoder

  @type minimal :: %__MODULE__{
          __info__: map,
          key: String.t() | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          spdx_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :key, :name, :node_id, :spdx_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:minimal) do
    [
      key: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      spdx_id: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
