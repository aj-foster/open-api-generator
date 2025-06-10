defmodule ApplicationUserRoleConnectionResponse do
  @moduledoc """
  Provides struct and type for a ApplicationUserRoleConnectionResponse
  """

  @type t :: %__MODULE__{
          metadata: ApplicationUserRoleConnectionResponseMetadata.t() | nil,
          platform_name: String.t() | nil,
          platform_username: String.t() | nil
        }

  defstruct [:metadata, :platform_name, :platform_username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: {:union, [{ApplicationUserRoleConnectionResponseMetadata, :t}, :null]},
      platform_name: {:union, [{:string, :generic}, :null]},
      platform_username: {:union, [{:string, :generic}, :null]}
    ]
  end
end
