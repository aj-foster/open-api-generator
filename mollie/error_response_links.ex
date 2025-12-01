defmodule Mollie.ErrorResponseLinks do
  @moduledoc """
  Provides struct and type for a ErrorResponseLinks
  """

  @type t :: %__MODULE__{documentation: Mollie.ErrorResponseLinksDocumentation.t()}

  defstruct [:documentation]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [documentation: {Mollie.ErrorResponseLinksDocumentation, :t}]
  end
end
