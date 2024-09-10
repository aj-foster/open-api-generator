defmodule ServerError do
  @moduledoc """
  Provides struct and type for a ServerError
  """

  @type json_resp :: %__MODULE__{errors: [ServerErrorErrors.json_resp()]}

  defstruct [:errors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [errors: [{ServerErrorErrors, :json_resp}]]
  end
end
