defmodule MetricAggregateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a MetricAggregateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          by: [String.t()] | nil,
          filter: [String.t()],
          interval: String.t() | nil,
          measurements: [String.t()],
          metric_id: String.t(),
          page_cursor: String.t() | nil,
          page_size: integer | nil,
          return_fields: [String.t()] | nil,
          sort: String.t() | nil,
          timezone: String.t() | nil
        }

  defstruct [
    :by,
    :filter,
    :interval,
    :measurements,
    :metric_id,
    :page_cursor,
    :page_size,
    :return_fields,
    :sort,
    :timezone
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      by: [
        enum: [
          "$attributed_channel",
          "$attributed_flow",
          "$attributed_message",
          "$attributed_variation",
          "$campaign_channel",
          "$flow",
          "$flow_channel",
          "$message",
          "$message_send_cohort",
          "$variation",
          "$variation_send_cohort",
          "Bounce Type",
          "Campaign Name",
          "Client Canonical",
          "Client Name",
          "Client Type",
          "Email Domain",
          "Failure Source",
          "Failure Type",
          "From Number",
          "From Phone Region",
          "List",
          "Message Name",
          "Message Type",
          "Method",
          "Subject",
          "To Number",
          "To Phone Region",
          "URL",
          "form_id"
        ]
      ],
      filter: [string: :generic],
      interval: {:enum, ["day", "hour", "month", "week"]},
      measurements: [enum: ["count", "sum_value", "unique"]],
      metric_id: {:string, :generic},
      page_cursor: {:string, :generic},
      page_size: :integer,
      return_fields: [string: :generic],
      sort:
        {:enum,
         [
           "$attributed_channel",
           "-$attributed_channel",
           "$attributed_flow",
           "-$attributed_flow",
           "$attributed_message",
           "-$attributed_message",
           "$attributed_variation",
           "-$attributed_variation",
           "$campaign_channel",
           "-$campaign_channel",
           "$flow",
           "-$flow",
           "$flow_channel",
           "-$flow_channel",
           "$message",
           "-$message",
           "$message_send_cohort",
           "-$message_send_cohort",
           "$variation",
           "-$variation",
           "$variation_send_cohort",
           "-$variation_send_cohort",
           "Bounce Type",
           "-Bounce Type",
           "Campaign Name",
           "-Campaign Name",
           "Client Canonical",
           "-Client Canonical",
           "Client Name",
           "-Client Name",
           "Client Type",
           "-Client Type",
           "Email Domain",
           "-Email Domain",
           "Failure Source",
           "-Failure Source",
           "Failure Type",
           "-Failure Type",
           "From Number",
           "-From Number",
           "From Phone Region",
           "-From Phone Region",
           "List",
           "-List",
           "Message Name",
           "-Message Name",
           "Message Type",
           "-Message Type",
           "Method",
           "-Method",
           "Subject",
           "-Subject",
           "To Number",
           "-To Number",
           "To Phone Region",
           "-To Phone Region",
           "URL",
           "-URL",
           "count",
           "-count",
           "form_id",
           "-form_id",
           "sum_value",
           "-sum_value",
           "unique",
           "-unique"
         ]},
      timezone: {:string, :generic}
    ]
  end
end
