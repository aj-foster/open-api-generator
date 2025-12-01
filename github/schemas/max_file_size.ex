defmodule GitHub.MaxFileSize do
  @moduledoc """
  Provides struct and type for a MaxFileSize
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          parameters: GitHub.MaxFileSizeParameters.t() | nil,
          type: String.t()
        }

  defstruct [:__info__, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [parameters: {GitHub.MaxFileSizeParameters, :t}, type: {:const, "max_file_size"}]
  end
end
