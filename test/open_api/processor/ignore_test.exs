defmodule OpenAPI.Processor.IgnoreTest do
  use ExUnit.Case, async: true

  alias OpenAPI.Processor.Ignore

  @profile __MODULE__

  setup do
    operation = %OpenAPI.Spec.Path.Operation{"$oag_base_file_path": [], "$oag_last_ref_path": []}
    schema = %OpenAPI.Spec.Schema{"$oag_base_file_path": [], "$oag_last_ref_path": []}
    state = %OpenAPI.Processor.State{profile: @profile}

    %{operation: operation, schema: schema, state: state}
  end

  describe "ignore_operation?/2" do
    test "does not ignore operation by default", %{operation: operation, state: state} do
      refute Ignore.ignore_operation?(state, operation)
    end

    test "ignores operation by ID", %{operation: operation, state: state} do
      operation = %OpenAPI.Spec.Path.Operation{operation | operation_id: "IgnoredOperation"}
      Application.put_env(:oapi_generator, @profile, ignore: ["IgnoredOperation"])
      assert Ignore.ignore_operation?(state, operation)
    end

    test "ignores operation by ID pattern", %{operation: operation, state: state} do
      operation = %OpenAPI.Spec.Path.Operation{operation | operation_id: "IgnoredOperation"}
      Application.put_env(:oapi_generator, @profile, ignore: [~r/^Ignored/])
      assert Ignore.ignore_operation?(state, operation)
    end

    test "ignores operation by path", %{operation: operation, state: state} do
      operation = %OpenAPI.Spec.Path.Operation{operation | "$oag_path": "/ignore/this"}
      Application.put_env(:oapi_generator, @profile, ignore: ["/ignore/this"])
      assert Ignore.ignore_operation?(state, operation)
    end

    test "ignores operation by path pattern", %{operation: operation, state: state} do
      operation = %OpenAPI.Spec.Path.Operation{operation | "$oag_path": "/ignore/this"}
      Application.put_env(:oapi_generator, @profile, ignore: [~r"^/ignore/"])
      assert Ignore.ignore_operation?(state, operation)
    end
  end

  describe "ignore_schema?/2" do
    test "does not ignore schema by default", %{schema: schema, state: state} do
      refute Ignore.ignore_schema?(state, schema)
    end

    test "ignores schema by base file path", %{schema: schema, state: state} do
      base_file_path = ["components", "schemas", "ignored_schema"]
      schema = %OpenAPI.Spec.Schema{schema | "$oag_base_file_path": base_file_path}

      Application.put_env(:oapi_generator, @profile,
        ignore: ["components/schemas/ignored_schema"]
      )

      assert Ignore.ignore_schema?(state, schema)
    end

    test "ignores schema by base file path pattern", %{schema: schema, state: state} do
      base_file_path = ["components", "schemas", "ignored_schema"]
      schema = %OpenAPI.Spec.Schema{schema | "$oag_base_file_path": base_file_path}
      Application.put_env(:oapi_generator, @profile, ignore: [~r|^components/schemas/ignored|])
      assert Ignore.ignore_schema?(state, schema)
    end

    test "ignores schema by ref path", %{schema: schema, state: state} do
      ref_path = ["components", "schemas", "ignored_schema"]
      schema = %OpenAPI.Spec.Schema{schema | "$oag_last_ref_path": ref_path}

      Application.put_env(:oapi_generator, @profile,
        ignore: ["components/schemas/ignored_schema"]
      )

      assert Ignore.ignore_schema?(state, schema)
    end

    test "ignores schema by ref path pattern", %{schema: schema, state: state} do
      ref_path = ["components", "schemas", "ignored_schema"]
      schema = %OpenAPI.Spec.Schema{schema | "$oag_last_ref_path": ref_path}
      Application.put_env(:oapi_generator, @profile, ignore: [~r|^components/schemas/ignored|])
      assert Ignore.ignore_schema?(state, schema)
    end

    test "ignores schema by title", %{schema: schema, state: state} do
      schema = %OpenAPI.Spec.Schema{schema | title: "IgnoredSchema"}
      Application.put_env(:oapi_generator, @profile, ignore: ["IgnoredSchema"])
      assert Ignore.ignore_schema?(state, schema)
    end

    test "ignores schema by title pattern", %{schema: schema, state: state} do
      schema = %OpenAPI.Spec.Schema{schema | title: "IgnoredSchema"}
      Application.put_env(:oapi_generator, @profile, ignore: [~r/^Ignored/])
      assert Ignore.ignore_schema?(state, schema)
    end
  end
end
