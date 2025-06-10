defmodule GitHub.Classroom.Repository do
  @moduledoc """
  Provides struct and type for a Classroom.Repository
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{
          __info__: map,
          default_branch: String.t(),
          full_name: String.t(),
          html_url: String.t(),
          id: integer,
          node_id: String.t(),
          private: boolean
        }

  defstruct [:__info__, :default_branch, :full_name, :html_url, :id, :node_id, :private]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:simple) do
    [
      default_branch: {:string, :generic},
      full_name: {:string, :generic},
      html_url: {:string, :uri},
      id: :integer,
      node_id: {:string, :generic},
      private: :boolean
    ]
  end
end
