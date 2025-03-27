defmodule OpenAPI.Processor.NamingTest do
  use ExUnit.Case, async: true
  doctest OpenAPI.Processor.Naming, import: true

  alias OpenAPI.Processor.Naming
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec

  @profile __MODULE__

  setup do
    %{state: %OpenAPI.Processor.State{profile: @profile}}
  end

  describe "operation_function/2" do
    test "creates operation function name based on operation ID", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])
      spec = %OperationSpec{operation_id: "example_op"}
      assert Naming.operation_function(state, spec) == :example_op
    end

    test "normalizes operation ID", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])
      spec = %OperationSpec{operation_id: "{companyId}_getById"}
      assert Naming.operation_function(state, spec) == :company_id_get_by_id
    end

    test "uses identifier after final slash", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])
      spec = %OperationSpec{operation_id: "get-/crm/v3/objects/companies/{companyId}_getById"}
      assert Naming.operation_function(state, spec) == :company_id_get_by_id
    end

    test "falls back to path-based name when operation ID is missing", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])

      spec = %OperationSpec{
        operation_id: nil,
        "$oag_path": "/test/api/{param}",
        "$oag_path_method": :put
      }

      assert Naming.operation_function(state, spec) == :test_api_param_put
    end
  end

  describe "operation_modules/2" do
    test "falls back to default operation module name", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])
      spec = %OperationSpec{operation_id: "example_op", tags: []}
      assert Naming.operation_modules(state, spec) == [Operations]
    end

    test "falls back to configured default operation module name", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [default_operation_module: MyOp])
      spec = %OperationSpec{operation_id: "example_op", tags: []}
      assert Naming.operation_modules(state, spec) == [MyOp]
    end

    test "uses operation ID slashes", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])
      spec = %OperationSpec{operation_id: "get-/crm/v3/{companyId}_getById", tags: []}
      assert Naming.operation_modules(state, spec) == [Get.Crm.V3]
    end

    test "ignores tags if configured not to use them", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [operation_use_tags: false])
      spec = %OperationSpec{operation_id: "example_op", tags: ["example"]}
      assert Naming.operation_modules(state, spec) == [Operations]
    end

    test "uses tags when available", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])
      spec = %OperationSpec{operation_id: "test/example_op", tags: ["example"]}
      assert Naming.operation_modules(state, spec) == [Test, Example]
    end

    test "normalizes tags", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])
      spec = %OperationSpec{operation_id: "test/example_op", tags: ["my ModName"]}
      assert Naming.operation_modules(state, spec) == [Test, MyModName]
    end

    test "handles missing operation IDs", %{state: state} do
      Application.put_env(:oapi_generator, @profile, [])
      spec = %OperationSpec{operation_id: nil, tags: ["my ModName"]}
      assert Naming.operation_modules(state, spec) == [MyModName]
    end
  end

  describe "rename_schema/2" do
    test "does nothing by default", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [rename: []])
      assert Naming.rename_schema({"RenamedSchema", "t"}, state) == {"RenamedSchema", "t"}
    end

    test "renames using string patterns", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [rename: [{"Abc", "ABC"}]])
      assert Naming.rename_schema({"SomethingAbC", "t"}, state) == {"SomethingAbC", "t"}
      assert Naming.rename_schema({"SomethingAbc", "t"}, state) == {"SomethingABC", "t"}
      assert Naming.rename_schema({"SomeAbcAbcThing", "t"}, state) == {"SomeABCABCThing", "t"}
    end

    test "renames using regex patterns", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [rename: [{~r/^Def/, "DEF"}]])
      assert Naming.rename_schema({"SomethingDef", "t"}, state) == {"SomethingDef", "t"}
      assert Naming.rename_schema({"DefSomething", "t"}, state) == {"DEFSomething", "t"}
    end
  end

  describe "group_schema/2" do
    test "does nothing by default", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [group: []])
      assert Naming.group_schema({"TestSchema", "t"}, state) == {"TestSchema", "t"}
    end

    test "groups schema based on prefixes", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [group: [Test]])
      assert Naming.group_schema({"TestSchema", "t"}, state) == {"Test.Schema", "t"}
      assert Naming.group_schema({"MyTest", "t"}, state) == {"MyTest", "t"}
    end

    test "groups multiple namespaces in order", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [group: [My, My.Test]])
      assert Naming.group_schema({"MyTestSchema", "t"}, state) == {"My.Test.Schema", "t"}
    end
  end

  describe "normalize_identifier/1" do
    test "normalizes identifiers" do
      assert Naming.normalize_identifier("example") == "example"
      assert Naming.normalize_identifier("example", :camel) == "Example"

      assert Naming.normalize_identifier("example_op") == "example_op"
      assert Naming.normalize_identifier("example_op", :camel) == "ExampleOp"

      assert Naming.normalize_identifier("exampleOp") == "example_op"
      assert Naming.normalize_identifier("exampleOp", :camel) == "ExampleOp"

      assert Naming.normalize_identifier("mod_{NAME}/example-Op") == "mod_name_example_op"
      assert Naming.normalize_identifier("mod_{NAME}/example-Op", :camel) == "ModNAMEExampleOp"
    end

    test "preserves abbreviations" do
      assert Naming.normalize_identifier("OpenAPISpec") == "open_api_spec"
      assert Naming.normalize_identifier("OpenAPISpec", :camel) == "OpenAPISpec"
    end
  end

  describe "raw_schema_module_and_type/3" do
    test "returns schema module and type", %{state: state} do
      state =
        state
        |> Map.put(:implementation, OpenAPI.Processor)
        |> Map.put(:schemas_by_ref, %{
          "ref" => %OpenAPI.Processor.Schema{
            ref: "ref",
            module_name: SchemaModuleName,
            type_name: "t"
          }
        })
        |> Map.put(:schema_specs_by_ref, %{"ref" => %OpenAPI.Spec.Schema{}})

      assert Naming.raw_schema_module_and_type(
               state,
               %OpenAPI.Processor.Schema{
                 context: [{:field, "ref", "test"}]
               },
               %OpenAPI.Spec.Schema{}
             ) == {"SchemaModuleNameTest", "t"}
    end

    test "normalizes field names", %{state: state} do
      state =
        state
        |> Map.put(:implementation, OpenAPI.Processor)
        |> Map.put(:schemas_by_ref, %{
          "ref" => %OpenAPI.Processor.Schema{
            ref: "ref",
            module_name: SchemaModuleName,
            type_name: "t"
          }
        })
        |> Map.put(:schema_specs_by_ref, %{"ref" => %OpenAPI.Spec.Schema{}})

      assert Naming.raw_schema_module_and_type(
               state,
               %OpenAPI.Processor.Schema{
                 context: [{:field, "ref", "test.field"}]
               },
               %OpenAPI.Spec.Schema{}
             ) == {"SchemaModuleNameTestField", "t"}

      assert Naming.raw_schema_module_and_type(
               state,
               %OpenAPI.Processor.Schema{
                 context: [{:field, "ref", "test/field"}]
               },
               %OpenAPI.Spec.Schema{}
             ) == {"SchemaModuleNameTestField", "t"}
    end
  end
end
