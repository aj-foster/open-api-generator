defmodule Example.Schema do
  @moduledoc "Easily define typed structs with decoders"

  defmacro __using__(_opts) do
    quote do
      import Example.Schema
    end
  end

  defmacro generated_schema(_fields) do
    quote do
      @type t :: %__MODULE__{
              permission: String.t(),
              role_name: String.t(),
              user: Example.NullableCollaborator.t()
            }

      defstruct [
        :permission,
        :role_name,
        :user
      ]

      def __fields__ do
        [
          permission: :string,
          role_name: :string,
          user: Example.NullableCollaborator
        ]
      end
    end
  end
end
