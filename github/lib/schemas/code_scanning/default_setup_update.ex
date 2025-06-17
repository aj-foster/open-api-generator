defmodule GitHub.CodeScanning.DefaultSetupUpdate do
  @moduledoc """
  Provides struct and type for a CodeScanning.DefaultSetupUpdate
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          languages: [String.t()] | nil,
          query_suite: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [:__info__, :languages, :query_suite, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      languages: [
        enum: [
          "c-cpp",
          "csharp",
          "go",
          "java-kotlin",
          "javascript-typescript",
          "python",
          "ruby",
          "swift"
        ]
      ],
      query_suite: {:enum, ["default", "extended"]},
      state: {:enum, ["configured", "not-configured"]}
    ]
  end
end
