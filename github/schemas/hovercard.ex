defmodule GitHub.Hovercard do
  @moduledoc """
  Provides struct and type for a Hovercard
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, contexts: [GitHub.HovercardContexts.t()]}

  defstruct [:__info__, :contexts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [contexts: [{GitHub.HovercardContexts, :t}]]
  end
end
