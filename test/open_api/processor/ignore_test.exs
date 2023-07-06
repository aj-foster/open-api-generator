defmodule OpenAPI.Processor.IgnoreTest do
  use ExUnit.Case, async: false

  alias OpenAPI.Processor.Ignore

  @profile __MODULE__

  setup do
    schema = %OpenAPI.Spec.Schema{"$oag_base_file_path": [], "$oag_last_ref_path": []}
    state = %OpenAPI.State{call: %OpenAPI.Call{profile: @profile}}

    %{schema: schema, state: state}
  end

  describe "ignored?/2" do
    test "does not ignore schema by default", %{schema: schema, state: state} do
      refute Ignore.ignored?(state, schema)
    end

    test "ignores schema by base file path", %{schema: schema, state: state} do
      base_file_path = ["components", "schemas", "ignored_schema"]
      schema = %OpenAPI.Spec.Schema{schema | "$oag_base_file_path": base_file_path}

      Application.put_env(:oapi_generator, @profile, ignore: ["components/schemas/ignored_schema"])

      assert Ignore.ignored?(state, schema)
    end

    test "ignores schema by base file path pattern", %{schema: schema, state: state} do
      base_file_path = ["components", "schemas", "ignored_schema"]
      schema = %OpenAPI.Spec.Schema{schema | "$oag_base_file_path": base_file_path}
      Application.put_env(:oapi_generator, @profile, ignore: [~r|^components/schemas/ignored|])
      assert Ignore.ignored?(state, schema)
    end

    test "ignores schema by ref path", %{schema: schema, state: state} do
      ref_path = ["components", "schemas", "ignored_schema"]
      schema = %OpenAPI.Spec.Schema{schema | "$oag_last_ref_path": ref_path}

      Application.put_env(:oapi_generator, @profile, ignore: ["components/schemas/ignored_schema"])

      assert Ignore.ignored?(state, schema)
    end

    test "ignores schema by ref path pattern", %{schema: schema, state: state} do
      ref_path = ["components", "schemas", "ignored_schema"]
      schema = %OpenAPI.Spec.Schema{schema | "$oag_last_ref_path": ref_path}
      Application.put_env(:oapi_generator, @profile, ignore: [~r|^components/schemas/ignored|])
      assert Ignore.ignored?(state, schema)
    end

    test "ignores schema by title", %{schema: schema, state: state} do
      schema = %OpenAPI.Spec.Schema{schema | title: "IgnoredSchema"}
      Application.put_env(:oapi_generator, @profile, ignore: ["IgnoredSchema"])
      assert Ignore.ignored?(state, schema)
    end

    test "ignores schema by title pattern", %{schema: schema, state: state} do
      schema = %OpenAPI.Spec.Schema{schema | title: "IgnoredSchema"}
      Application.put_env(:oapi_generator, @profile, ignore: [~r/^Ignored/])
      assert Ignore.ignored?(state, schema)
    end
  end
end
