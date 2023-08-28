defmodule OpenAPI.Call do
  @moduledoc """
  Information about the original invocation of the code generator

  > #### Note {:.info}
  >
  > It is not expected that clients will interact with this module directly.
  """

  @type t :: %__MODULE__{files: [String.t()], profile: atom}
  defstruct [:files, :profile]

  @doc false
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
