defmodule OpenAPI.Processor.State do
  @moduledoc false
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @type t :: %__MODULE__{
          implementation: module,
          operations: [Operation.t()],
          profile: atom,
          schema_specs_by_ref: %{reference => SchemaSpec.t()},
          schema_refs_by_path: %{term => reference},
          spec: OpenAPI.Spec.t()
        }

  defstruct [
    :implementation,
    :operations,
    :profile,
    :schema_specs_by_ref,
    :schema_refs_by_path,
    :spec
  ]

  @spec new(OpenAPI.State.t()) :: t
  def new(state) do
    profile = profile(state)

    %__MODULE__{
      implementation: implementation(profile),
      operations: [],
      profile: profile,
      schema_specs_by_ref: %{},
      schema_refs_by_path: %{},
      spec: state.spec
    }
  end

  @spec implementation(atom) :: module
  defp implementation(profile) do
    Application.get_env(:oapi_generator, profile)
    |> Keyword.get(:processor, OpenAPI.Processor)
  end

  @spec profile(OpenAPI.State.t()) :: atom
  defp profile(state) do
    %OpenAPI.State{call: %OpenAPI.Call{profile: profile}} = state

    profile
  end

  #
  # Manipulation
  #

  @doc """
  Get a schema reference by the last ref file/path
  """
  @spec get_schema_ref_by_path(t, SchemaSpec.t()) :: reference | nil
  def get_schema_ref_by_path(state, schema_spec) do
    %__MODULE__{schema_refs_by_path: registry} = state

    %SchemaSpec{
      "$oag_last_ref_file": last_ref_file,
      "$oag_last_ref_path": last_ref_path
    } = schema_spec

    Map.get(registry, {last_ref_file, last_ref_path})
  end

  @doc """
  Add a schema spec to the processor state and generate a reference for it
  """
  @spec put_schema_spec(t, SchemaSpec.t()) :: {t, reference}
  def put_schema_spec(state, schema_spec) do
    %SchemaSpec{
      "$oag_last_ref_file": last_ref_file,
      "$oag_last_ref_path": last_ref_path
    } = schema_spec

    path = {last_ref_file, last_ref_path}
    ref = make_ref()

    state = %__MODULE__{
      state
      | schema_refs_by_path: Map.put(state.schema_refs_by_path, path, ref),
        schema_specs_by_ref: Map.put(state.schema_specs_by_ref, ref, schema_spec)
    }

    {state, ref}
  end
end
