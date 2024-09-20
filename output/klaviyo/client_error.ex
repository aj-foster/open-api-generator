defmodule ClientError do
  @moduledoc """
  Provides struct and type for a ClientError
  """

  @type json_resp :: %__MODULE__{errors: [ClientErrorErrors.json_resp()]}

  defstruct [:errors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [errors: [{ClientErrorErrors, :json_resp}]]
  end
end
