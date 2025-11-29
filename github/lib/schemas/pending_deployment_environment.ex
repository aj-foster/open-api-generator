defmodule GitHub.PendingDeploymentEnvironment do
  @moduledoc """
  Provides struct and type for a PendingDeploymentEnvironment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          html_url: String.t() | nil,
          id: integer | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :html_url, :id, :name, :node_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html_url: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
