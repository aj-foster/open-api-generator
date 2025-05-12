defmodule WelcomeScreenPatchRequestPartial do
  @moduledoc """
  Provides struct and type for a WelcomeScreenPatchRequestPartial
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          enabled: boolean | nil,
          welcome_channels: [map] | nil
        }

  defstruct [:description, :enabled, :welcome_channels]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      enabled: {:union, [:boolean, :null]},
      welcome_channels: {:union, [[:map], :null]}
    ]
  end
end
