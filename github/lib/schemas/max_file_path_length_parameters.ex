defmodule GitHub.MaxFilePathLengthParameters do
  @moduledoc """
  Provides struct and type for a MaxFilePathLengthParameters
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, max_file_path_length: integer}

  defstruct [:__info__, :max_file_path_length]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_file_path_length: :integer]
  end
end
