defmodule GitHub.PorterAuthor do
  @moduledoc """
  Provides struct and type for a PorterAuthor
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          email: String.t(),
          id: integer,
          import_url: String.t(),
          name: String.t(),
          remote_id: String.t(),
          remote_name: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :email, :id, :import_url, :name, :remote_id, :remote_name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :generic},
      id: :integer,
      import_url: {:string, :uri},
      name: {:string, :generic},
      remote_id: {:string, :generic},
      remote_name: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
