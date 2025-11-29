defmodule ContextResp do
  @moduledoc """
  Provides struct and type for a ContextResp
  """

  @type t :: %__MODULE__{
          message: String.t() | nil,
          name: String.t() | nil,
          responseJSON: ContextRespResponseJSON.t() | nil,
          stack: String.t() | nil,
          status: integer | nil,
          statusText: String.t() | nil
        }

  defstruct [:message, :name, :responseJSON, :stack, :status, :statusText]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      message: {:string, :generic},
      name: {:string, :generic},
      responseJSON: {ContextRespResponseJSON, :t},
      stack: {:string, :generic},
      status: :integer,
      statusText: {:string, :generic}
    ]
  end
end
