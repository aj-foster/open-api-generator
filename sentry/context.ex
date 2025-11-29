defmodule Context do
  @moduledoc """
  Provides struct and type for a Context
  """

  @type t :: %__MODULE__{
          resp: ContextResp.t() | nil,
          session: ContextSession.t() | nil,
          unauthorized: boolean | nil,
          url: String.t() | nil
        }

  defstruct [:resp, :session, :unauthorized, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      resp: {ContextResp, :t},
      session: {ContextSession, :t},
      unauthorized: :boolean,
      url: {:string, :generic}
    ]
  end
end
