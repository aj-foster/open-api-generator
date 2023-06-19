defmodule OpenAPI.Call do
  # Represents the original invocation of the code generator
  @moduledoc false

  @type t :: %__MODULE__{files: [String.t()], profile: atom}
  defstruct [:files, :profile]

  @spec new(String.t(), [String.t()]) :: t
  def new(profile, files) do
    config = Application.get_all_env(:oapi_generator)

    profiles =
      config
      |> Keyword.keys()
      |> Enum.map(&to_string/1)

    if profile not in profiles do
      raise """
      Profile #{profile} not found in configuration

      Expected:

          config :oapi_generator,
            #{profile}: [...]

      """
    end

    %__MODULE__{
      files: files,
      profile: String.to_existing_atom(profile)
    }
  end
end
