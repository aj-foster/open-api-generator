defmodule OpenAPI.Processor.Ignore do
  @moduledoc """
  Default plugin for ignoring schemas and operations
  """
  alias OpenAPI.Spec.Path.Operation
  alias OpenAPI.Spec.Schema

  @typedoc "Definition of a module to ignore"
  @type definition :: String.t() | Regex.t()

  @spec ignored?(OpenAPI.State.t(), Operation.t()) :: boolean
  @spec ignored?(OpenAPI.State.t(), Schema.t()) :: boolean
  def ignored?(_state, %Operation{} = _operation) do
    false
  end

  def ignored?(state, %Schema{} = schema) do
    %Schema{"$oag_base_file_path": base_path, "$oag_last_ref_path": ref_path, title: title} =
      schema

    patterns_to_ignore = config(state)

    base_path = Enum.join(base_path, "/")
    ref_path = Enum.join(ref_path, "/")

    combinations_to_check =
      for x <- [base_path, ref_path, title], y <- patterns_to_ignore do
        {x, y}
      end

    Enum.any?(combinations_to_check, fn
      {nil, _pattern} -> false
      {value, %Regex{} = regex} -> Regex.match?(regex, value)
      {value, value} -> true
      {_value, _string_pattern} -> false
    end)
  end

  @spec config(OpenAPI.State.t()) :: [definition]
  defp config(state) do
    %OpenAPI.State{call: %OpenAPI.Call{profile: profile}} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:ignore, [])
  end
end
