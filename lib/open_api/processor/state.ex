defmodule OpenAPI.Processor.State do
  @moduledoc """
  State of the process phase of code generation

  This struct is created at the beginning of the process phase using data from the overall
  generator `OpenAPI.State`. It has the following fields:

    * `implementation`: Module configured as the implementation of the processor (defaults to
      `OpenAPI.Processor`). Callbacks must use this field when calling other process callbacks.
    * `operations`: Cumulative list of `t:OpenAPI.Processor.Operation.t/0` structs identified
      and processed so far.
    * `profile`: Name of the active configuration profile. Callbacks must use this field when
      looking up configuration from the application environment.
    * `schema_specs_by_path`: Map of raw schema specifications keyed by the original paths where
      they could be found in the spec files, as provided by the read phase. This map may include
      schemas that are not used in operations.
    * `schema_specs_by_ref`: Cumulative map of raw schema specifications keyed by the internal
      `ref`s used to refer to them in types.
    * `schema_refs_by_path`: Cumulative map of internal `ref`s used to refer to schemas keyed by
      the original paths where they could be found in the spec files.
    * `schemas_by_ref`: Cumulative map of processed `t:OpenAPI.Processor.Schema.t/0` structs
      keyed by the internal `ref`s used to refer to them in types, as they are processed.
    * `spec`: The original parsed OpenAPI description.

  All of this data is managed by the code generator, and it is unlikely that a callback would
  need to transform this struct directly.
  """
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Spec
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @type t :: %__MODULE__{
          implementation: module,
          operations: [Operation.t()],
          profile: atom,
          schema_specs_by_ref: %{reference => SchemaSpec.t()},
          schema_refs_by_path: %{term => reference},
          schemas_by_ref: %{reference => Schema.t()},
          spec: OpenAPI.Spec.t()
        }

  defstruct [
    :implementation,
    :operations,
    :profile,
    :schema_specs_by_path,
    :schema_specs_by_ref,
    :schema_refs_by_path,
    :schemas_by_ref,
    :spec
  ]

  @doc false
  @spec new(OpenAPI.State.t()) :: t
  def new(state) do
    profile = profile(state)

    %__MODULE__{
      implementation: implementation(profile),
      operations: [],
      profile: profile,
      schema_specs_by_path: state.schema_specs_by_path,
      schema_specs_by_ref: %{},
      schema_refs_by_path: %{},
      schemas_by_ref: %{},
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
  For schema references, put a placeholder ref in the state without a schema spec
  """
  @spec put_schema_ref(t, Spec.full_path()) :: {t, reference}
  def put_schema_ref(state, path) do
    schema_spec = Map.fetch!(state.schema_specs_by_path, path)
    put_schema_spec(state, schema_spec)
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

    if ref = Map.get(state.schema_refs_by_path, path) do
      schema_spec =
        if existing_schema_spec = Map.get(state.schema_specs_by_ref, ref) do
          SchemaSpec.merge_contexts(existing_schema_spec, schema_spec)
        else
          schema_spec
        end

      state = %__MODULE__{
        state
        | schema_specs_by_ref: Map.put(state.schema_specs_by_ref, ref, schema_spec)
      }

      {state, ref}
    else
      ref = make_ref()

      state = %__MODULE__{
        state
        | schema_refs_by_path: Map.put(state.schema_refs_by_path, path, ref),
          schema_specs_by_ref: Map.put(state.schema_specs_by_ref, ref, schema_spec)
      }

      {state, ref}
    end
  end

  @doc """
  Add a processed schema to the processor state by its reference
  """
  @spec put_schema(t, reference, Schema.t()) :: t
  def put_schema(state, ref, schema) do
    %__MODULE__{state | schemas_by_ref: Map.put(state.schemas_by_ref, ref, schema)}
  end
end
