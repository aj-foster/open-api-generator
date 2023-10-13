defmodule OpenAPI.Generator.OperationTest do
  use ExUnit.Case, async: true

  alias OpenAPI.Spec.Path.Operation
  alias OpenAPI.Spec.Path

  describe "names/1" do
    test "names a tagless operation" do
      assert [{[], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "example_op", tags: []})

      assert [{[], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "exampleOp", tags: []})

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "mod_name/example_op", tags: []})

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "modName/exampleOp", tags: []})

      assert [{["Other", "ModName"], "example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "other/mod_name/example_op",
                 tags: []
               })

      assert [{["Other", "ModName"], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "other/modName/exampleOp", tags: []})

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "mod-name/example-op", tags: []})
    end

    test "names a tagged operation" do
      assert [{["OpenAI"], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "example_op", tags: ["OpenAI"]})

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "example_op", tags: ["mod_name"]})

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "exampleOp", tags: ["modName"]})

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "mod_name/example_op",
                 tags: ["mod_name"]
               })

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "modName/exampleOp",
                 tags: ["mod_name"]
               })

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "mod_name/example_op",
                 tags: ["modName"]
               })

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "modName/exampleOp",
                 tags: ["modName"]
               })

      assert [{["Other"], "mod_name_example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "other/mod_name/example_op",
                 tags: ["other"]
               })

      assert [{["Other"], "mod_name_example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "other/modName/exampleOp",
                 tags: ["other"]
               })

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{operation_id: "example-op", tags: ["mod-name"]})

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "example   -op",
                 tags: ["mod-/  name"]
               })

      assert [{["ModName"], "example_op"}] =
               Operation.names(%Path.Operation{
                 operation_id: "Example   -OP",
                 tags: ["Mod Name"]
               })

      assert [{["ModName"], "get_crm_v3_objects_companies_company_id_get_by_id"}] =
               Operation.names(%Path.Operation{
                 operation_id: "get-/crm/v3/objects/companies/{companyId}_getById",
                 tags: ["Mod Name"]
               })
    end

    test "names an operation with multiple tags" do
      assert [
               {["ModName"], "example_op"},
               {["Other"], "mod_name_example_op"}
             ] =
               Operation.names(%Path.Operation{
                 operation_id: "mod_name/example_op",
                 tags: ["mod_name", "other"]
               })
    end
  end
end
