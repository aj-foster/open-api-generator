defmodule GitHub.MaxFilePathLength do
  @moduledoc """
  Provides struct and type for a MaxFilePathLength
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          parameters: GitHub.MaxFilePathLengthParameters.t() | nil,
          type: String.t()
        }

  defstruct [:__info__, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [parameters: {GitHub.MaxFilePathLengthParameters, :t}, type: {:const, "max_file_path_length"}]
  end
end
