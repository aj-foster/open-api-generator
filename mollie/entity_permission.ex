defmodule Mollie.EntityPermission do
  @moduledoc """
  Provides struct and type for a EntityPermission
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityPermissionLinks.t(),
          description: String.t(),
          granted: boolean,
          id: Mollie.EntityPermissionId.t(),
          resource: String.t()
        }

  defstruct [:_links, :description, :granted, :id, :resource]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityPermissionLinks, :t},
      description: :string,
      granted: :boolean,
      id: {Mollie.EntityPermissionId, :t},
      resource: :string
    ]
  end
end
