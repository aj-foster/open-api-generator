defmodule Discord.CreatePrivateChannelRequest do
  @moduledoc """
  Provides struct and type for a CreatePrivateChannelRequest
  """

  @type t :: %__MODULE__{
          access_tokens: [String.t()] | nil,
          nicks: map | nil,
          recipient_id: String.t() | nil
        }

  defstruct [:access_tokens, :nicks, :recipient_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_tokens: {:union, [[:string], :null]},
      nicks: {:union, [:map, :null]},
      recipient_id: {:union, [{:string, "snowflake"}, :null]}
    ]
  end
end
