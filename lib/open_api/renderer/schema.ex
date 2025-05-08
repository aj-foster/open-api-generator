defmodule OpenAPI.Renderer.Schema do
  @moduledoc """
  Default implementation for callbacks related to rendering schemas

  This module contains the default implementations for:

    * `c:OpenAPI.Renderer.render_schema/2`
    * `c:OpenAPI.Renderer.render_schema_field_function/2`
    * `c:OpenAPI.Renderer.render_schema_struct/2`
    * `c:OpenAPI.Renderer.render_schema_types/2`

  ## Extra Fields

  It is sometimes useful for client libraries to store additional information on the structs
  defined by the API description. This kind of private information is supported using the
  `output.extra_fields` configuration. Each entry in the keyword list must use the name of the
  field as the atom key and the type as the value. Types can be any valid
  `t:OpenAPI.Processor.Type.t/0`.

  Example:

      config :oapi_generator, default: [
        output: [
          __info__: :map
        ]
      ]

  This will result in a field `info: map` added to every schema typespec and `:info` added to
  every struct definition.

  ## Configuration

  All configuration offered by the functions in this module lives under the `output` key of the
  active configuration profile. For example (default values shown):

      # config/config.exs

      config :oapi_generator, default: [
        output: [
          extra_fields: []
        ]
      ]

  """
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.Schema.Field
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State
  alias OpenAPI.Renderer.Util

  @doc """
  Render a schema, including typespecs, struct definition, and field function

  Default implementation of `c:OpenAPI.Renderer.render_schema/2`.

  This implementation operates on schemas that appear in multiple contexts. If a schema appears
  in exactly one context as the request or response body of a function, it will instead be
  rendered by an operation callback.

  This function calls the following other callbacks and concatenates their results:

    * `c:OpenAPI.Renderer.render_schema_types/2`
    * `c:OpenAPI.Renderer.render_schema_struct/2`
    * `c:OpenAPI.Renderer.render_schema_field_function/2`

  """
  @spec render(State.t(), File.t()) :: Macro.t()
  def render(state, file) do
    %State{implementation: implementation} = state
    %File{module: module, schemas: schemas} = file

    # Reject schemas that only appear in a single request or response body.
    non_operation_schemas =
      schemas
      |> Enum.filter(&(&1.output_format == :struct))
      |> Enum.group_by(&{&1.module_name, &1.type_name})
      |> Enum.map(fn {_module_and_type, schemas} -> Enum.reduce(schemas, &Schema.merge/2) end)
      |> List.flatten()
      |> Enum.sort_by(& &1.type_name)

    output_schemas =
      schemas
      |> Enum.filter(fn
        %Schema{output_format: :struct} ->
          true

        # %Schema{context: [{:request, ^module, _, _}]} -> true
        %Schema{context: [{:response, ^module, _, _, _}], output_format: :typed_map} ->
          true

        %Schema{context: [{:field, parent_ref, _}], output_format: :typed_map} ->
          parent_is_response?(parent_ref, module, state)

        _else ->
          false
      end)
      |> Enum.group_by(&{&1.module_name, &1.type_name})
      |> Enum.map(fn {_module_and_type, schemas} -> Enum.reduce(schemas, &Schema.merge/2) end)
      |> List.flatten()
      |> Enum.sort_by(& &1.type_name)

    types_and_struct =
      if length(non_operation_schemas) > 0 do
        types = implementation.render_schema_types(state, non_operation_schemas)
        struct = implementation.render_schema_struct(state, non_operation_schemas)

        [types, struct]
      else
        []
      end

    field_function =
      if length(output_schemas) > 0 do
        implementation.render_schema_field_function(state, output_schemas)
      else
        []
      end

    Util.clean_list([types_and_struct, field_function])
  end

  defp parent_is_response?(parent_ref, module, state) do
    case Map.get(state.schemas, parent_ref) do
      %Schema{context: [{:response, ^module, _, _, _}], output_format: :typed_map} ->
        true

      %Schema{context: [{:field, parent_ref, _}], output_format: :typed_map} ->
        parent_is_response?(parent_ref, module, state)

      _else ->
        false
    end
  end

  @doc """
  Render the typespec(s) for all of the given schemas

  Default implementation of `c:OpenAPI.Renderer.render_schema_types/2`.

  This implementation uses the `output.extra_fields` configuration to add additional fields to
  the struct for private use by the client library. See **Extra Fields** in this module's
  documentation.
  """
  @spec render_types(State.t(), [Schema.t()]) :: Macro.t()
  def render_types(state, schemas) do
    for %Schema{fields: fields, output_format: format, type_name: type} <- schemas do
      fields = render_type_fields(state, fields)

      if format == :struct do
        quote do
          @type unquote({type, [], nil}) :: %__MODULE__{
                  unquote_splicing(fields)
                }
        end
      else
        quote do
          @type unquote({type, [], nil}) :: %{
                  unquote_splicing(fields)
                }
        end
      end
      |> Util.put_newlines()
    end
  end

  @spec render_type_fields(State.t(), [Field.t()]) :: Macro.t()
  defp render_type_fields(state, fields) do
    for field <- Enum.sort_by(fields ++ extra_fields(state), & &1.name) do
      %Field{name: name, nullable: nullable?, required: required?, type: type} = field

      rendered_type =
        if nullable? or not required? do
          Util.to_type(state, {:union, [type, :null]})
        else
          Util.to_type(state, type)
        end

      quote do
        {unquote(String.to_atom(name)), unquote(rendered_type)}
      end
    end
  end

  @doc """
  Render a single struct definition for all of the given schemas

  Default implementation of `c:OpenAPI.Renderer.render_schema_struct/2`.

  This implementation combines the fields of all schemas to create one struct. It also uses the
  `output.extra_fields` configuration to add additional fields to the struct for private use by
  the client library. See **Extra Fields** in this module's documentation.
  """
  @spec render_struct(State.t(), [Schema.t()]) :: Macro.t()
  def render_struct(state, schemas) do
    fields =
      Enum.map(schemas, & &1.fields)
      |> List.insert_at(0, extra_fields(state))
      |> List.flatten()
      |> Enum.map(&String.to_atom(&1.name))
      |> Enum.sort()
      |> Enum.dedup()

    quote do
      defstruct unquote(fields)
    end
    |> Util.put_newlines()
  end

  @spec extra_fields(State.t()) :: [Field.t()]
  defp extra_fields(state) do
    extra_fields = config(state)[:extra_fields] || []

    Enum.map(extra_fields, fn {name, type} ->
      %Field{name: to_string(name), nullable: false, private: true, required: true, type: type}
    end)
  end

  @doc """
  Render a function `__fields__/1` that returns information about schema field types

  Default implementation of `c:OpenAPI.Renderer.render_schema_field_function/2`.

  This implementation renders a function spec and header with one clause for each schema type.
  """
  @spec render_field_function(State.t(), [Schema.t()]) :: Macro.t()
  def render_field_function(state, schemas)
  def render_field_function(_state, []), do: []

  def render_field_function(state, schemas) do
    docstring =
      quote do
        @doc false
      end

    typespec =
      quote do
        @spec __fields__(atom) :: keyword
      end

    header =
      if Enum.any?(schemas, &(&1.type_name == :t)) do
        quote do
          def __fields__(type \\ :t)
        end
      end

    function_clauses =
      schemas
      |> Enum.sort_by(& &1.type_name)
      |> Enum.map(&render_field_function_clause(state, &1))

    Util.clean_list([docstring, typespec, header, function_clauses])
  end

  defp render_field_function_clause(state, schema) do
    %Schema{fields: fields, type_name: type} = schema
    fields = render_field_function_clause_fields(state, fields)

    quote do
      def __fields__(unquote(type)) do
        unquote(fields)
      end
    end
  end

  defp render_field_function_clause_fields(state, fields) do
    fields
    |> Enum.reject(& &1.private)
    |> Enum.sort_by(& &1.name)
    |> Enum.map(fn %Field{name: name, type: type} ->
      quote do
        {unquote(String.to_atom(name)), unquote(Util.to_readable_type(state, type))}
      end
    end)
  end

  #
  # Helpers
  #

  @spec config(OpenAPI.Renderer.State.t()) :: Keyword.t()
  defp config(state) do
    %OpenAPI.Renderer.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:output, [])
  end
end
