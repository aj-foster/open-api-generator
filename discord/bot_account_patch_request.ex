defmodule BotAccountPatchRequest do
  @moduledoc """
  Provides struct and type for a BotAccountPatchRequest
  """

  @type t :: %__MODULE__{avatar: String.t() | nil, banner: String.t() | nil, username: String.t()}

  defstruct [:avatar, :banner, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {:union, [{:string, :generic}, :null]},
      banner: {:union, [{:string, :generic}, :null]},
      username: {:string, :generic}
    ]
  end
end
