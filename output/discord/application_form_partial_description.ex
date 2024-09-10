defmodule ApplicationFormPartialDescription do
  @moduledoc """
  Provides struct and type for a ApplicationFormPartialDescription
  """

  @type t :: %__MODULE__{
          default: String.t(),
          localizations: ApplicationFormPartialDescriptionLocalizations.t() | nil
        }

  defstruct [:default, :localizations]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default: {:string, :generic},
      localizations: {:union, [{ApplicationFormPartialDescriptionLocalizations, :t}, :null]}
    ]
  end
end
