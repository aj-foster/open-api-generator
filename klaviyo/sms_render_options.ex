defmodule SMSRenderOptions do
  @moduledoc """
  Provides struct and type for a SMSRenderOptions
  """

  @type t :: %__MODULE__{
          add_info_link: boolean,
          add_opt_out_language: boolean,
          add_org_prefix: boolean,
          shorten_links: boolean
        }

  defstruct [:add_info_link, :add_opt_out_language, :add_org_prefix, :shorten_links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      add_info_link: :boolean,
      add_opt_out_language: :boolean,
      add_org_prefix: :boolean,
      shorten_links: :boolean
    ]
  end
end
