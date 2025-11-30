defmodule OpenAI.InviteRequest do
  @moduledoc """
  Provides struct and type for a InviteRequest
  """

  @type t :: %__MODULE__{
          email: String.t(),
          projects: [OpenAI.InviteRequestProjects.t()] | nil,
          role: String.t()
        }

  defstruct [:email, :projects, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: :string,
      projects: [{OpenAI.InviteRequestProjects, :t}],
      role: {:enum, ["reader", "owner"]}
    ]
  end
end
