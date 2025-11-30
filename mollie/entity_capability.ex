defmodule Mollie.EntityCapability do
  @moduledoc """
  Provides struct and type for a EntityCapability
  """

  @type t :: %__MODULE__{
          name: String.t(),
          requirements: [Mollie.EntityCapabilityRequirement.t()],
          resource: String.t(),
          status: String.t(),
          statusReason: String.t()
        }

  defstruct [:name, :requirements, :resource, :status, :statusReason]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: :string,
      requirements: [{Mollie.EntityCapabilityRequirement, :t}],
      resource: :string,
      status: {:enum, ["unrequested", "enabled", "disabled", "pending"]},
      statusReason: {:enum, ["requirement-past-due", "onboarding-information-needed"]}
    ]
  end
end
