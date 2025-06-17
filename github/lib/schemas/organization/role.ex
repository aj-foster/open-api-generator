defmodule GitHub.Organization.Role do
  @moduledoc """
  Provides struct and type for a Organization.Role
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: integer,
          name: String.t(),
          organization: GitHub.User.simple() | nil,
          permissions: [String.t()],
          updated_at: DateTime.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :description,
    :id,
    :name,
    :organization,
    :permissions,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      id: :integer,
      name: {:string, :generic},
      organization: {:union, [{GitHub.User, :simple}, :null]},
      permissions: [string: :generic],
      updated_at: {:string, :date_time}
    ]
  end
end
