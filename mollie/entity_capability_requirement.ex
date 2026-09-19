defmodule Mollie.EntityCapabilityRequirement do
  @moduledoc """
  Provides struct and type for a EntityCapabilityRequirement
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityCapabilityRequirementLinks.t(),
          dueDate: String.t() | nil,
          id: String.t(),
          status: String.t()
        }

  defstruct [:_links, :dueDate, :id, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityCapabilityRequirementLinks, :t},
      dueDate: {:union, [:string, :null]},
      id: :string,
      status: {:enum, ["currently-due", "past-due", "requested"]}
    ]
  end
end
