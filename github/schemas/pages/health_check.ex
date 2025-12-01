defmodule GitHub.Pages.HealthCheck do
  @moduledoc """
  Provides struct and type for a Pages.HealthCheck
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          alt_domain: GitHub.Pages.HealthCheckAltDomain.t() | nil,
          domain: GitHub.Pages.HealthCheckDomain.t() | nil
        }

  defstruct [:__info__, :alt_domain, :domain]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      alt_domain: {:union, [{GitHub.Pages.HealthCheckAltDomain, :t}, :null]},
      domain: {GitHub.Pages.HealthCheckDomain, :t}
    ]
  end
end
