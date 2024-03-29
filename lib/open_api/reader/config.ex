defmodule OpenAPI.Reader.Config do
  @moduledoc """
  Configuration for the read phase

  For more information, see the **Configuration** section of the documentation for
  `OpenAPI.Reader`.
  """

  @type t :: %__MODULE__{
          additional_files: [String.t()],
          file: String.t() | nil,
          passed_files: [String.t()]
        }

  defstruct [
    :additional_files,
    :file,
    :passed_files
  ]

  @doc false
  @spec new(OpenAPI.State.t()) :: t
  def new(state) do
    %OpenAPI.State{call: %OpenAPI.Call{files: files, profile: profile}} = state

    options =
      Application.get_env(:oapi_generator, profile)
      |> Keyword.get(:reader, [])

    %__MODULE__{
      additional_files: Keyword.get(options, :additional_files, []),
      file: Keyword.get(options, :file, nil),
      passed_files: files
    }
  end
end
