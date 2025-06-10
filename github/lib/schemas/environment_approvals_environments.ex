defmodule GitHub.EnvironmentApprovalsEnvironments do
  @moduledoc """
  Provides struct and type for a EnvironmentApprovalsEnvironments
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t() | nil,
          html_url: String.t() | nil,
          id: integer | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          updated_at: DateTime.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :created_at, :html_url, :id, :name, :node_id, :updated_at, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      html_url: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :generic}
    ]
  end
end
