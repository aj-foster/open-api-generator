defmodule GitHub.CodeScanning.DefaultSetup do
  @moduledoc """
  Provides struct and type for a CodeScanning.DefaultSetup
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          languages: [String.t()] | nil,
          query_suite: String.t() | nil,
          schedule: String.t() | nil,
          state: String.t() | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [:__info__, :languages, :query_suite, :schedule, :state, :updated_at]

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
          "javascript",
          "python",
          "ruby",
          "typescript",
          "swift"
        ]
      ],
      query_suite: {:enum, ["default", "extended"]},
      schedule: {:enum, ["weekly", nil]},
      state: {:enum, ["configured", "not-configured"]},
      updated_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
