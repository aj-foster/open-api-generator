defmodule PatchImageResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PatchImageResponseDataAttributes
  """

  @type t :: %__MODULE__{
          format: String.t(),
          hidden: boolean,
          image_url: String.t(),
          name: String.t(),
          size: integer,
          updated_at: DateTime.t()
        }

  defstruct [:format, :hidden, :image_url, :name, :size, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      format: {:string, :generic},
      hidden: :boolean,
      image_url: {:string, :generic},
      name: {:string, :generic},
      size: :integer,
      updated_at: {:string, :date_time}
    ]
  end
end
