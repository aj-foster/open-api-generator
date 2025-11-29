defmodule GitHub.Pages.HealthCheckAltDomain do
  @moduledoc """
  Provides struct and type for a Pages.HealthCheckAltDomain
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          caa_error: String.t() | nil,
          dns_resolves: boolean | nil,
          enforces_https: boolean | nil,
          has_cname_record: boolean | nil,
          has_mx_records_present: boolean | nil,
          host: String.t() | nil,
          https_error: String.t() | nil,
          is_a_record: boolean | nil,
          is_apex_domain: boolean | nil,
          is_cloudflare_ip: boolean | nil,
          is_cname_to_fastly: boolean | nil,
          is_cname_to_github_user_domain: boolean | nil,
          is_cname_to_pages_dot_github_dot_com: boolean | nil,
          is_fastly_ip: boolean | nil,
          is_https_eligible: boolean | nil,
          is_non_github_pages_ip_present: boolean | nil,
          is_old_ip_address: boolean | nil,
          is_pages_domain: boolean | nil,
          is_pointed_to_github_pages_ip: boolean | nil,
          is_proxied: boolean | nil,
          is_served_by_pages: boolean | nil,
          is_valid: boolean | nil,
          is_valid_domain: boolean | nil,
          nameservers: String.t() | nil,
          reason: String.t() | nil,
          responds_to_https: boolean | nil,
          should_be_a_record: boolean | nil,
          uri: String.t() | nil
        }

  defstruct [
    :__info__,
    :caa_error,
    :dns_resolves,
    :enforces_https,
    :has_cname_record,
    :has_mx_records_present,
    :host,
    :https_error,
    :is_a_record,
    :is_apex_domain,
    :is_cloudflare_ip,
    :is_cname_to_fastly,
    :is_cname_to_github_user_domain,
    :is_cname_to_pages_dot_github_dot_com,
    :is_fastly_ip,
    :is_https_eligible,
    :is_non_github_pages_ip_present,
    :is_old_ip_address,
    :is_pages_domain,
    :is_pointed_to_github_pages_ip,
    :is_proxied,
    :is_served_by_pages,
    :is_valid,
    :is_valid_domain,
    :nameservers,
    :reason,
    :responds_to_https,
    :should_be_a_record,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      caa_error: {:union, [{:string, :generic}, :null]},
      dns_resolves: :boolean,
      enforces_https: :boolean,
      has_cname_record: {:union, [:boolean, :null]},
      has_mx_records_present: {:union, [:boolean, :null]},
      host: {:string, :generic},
      https_error: {:union, [{:string, :generic}, :null]},
      is_a_record: {:union, [:boolean, :null]},
      is_apex_domain: :boolean,
      is_cloudflare_ip: {:union, [:boolean, :null]},
      is_cname_to_fastly: {:union, [:boolean, :null]},
      is_cname_to_github_user_domain: {:union, [:boolean, :null]},
      is_cname_to_pages_dot_github_dot_com: {:union, [:boolean, :null]},
      is_fastly_ip: {:union, [:boolean, :null]},
      is_https_eligible: {:union, [:boolean, :null]},
      is_non_github_pages_ip_present: {:union, [:boolean, :null]},
      is_old_ip_address: {:union, [:boolean, :null]},
      is_pages_domain: :boolean,
      is_pointed_to_github_pages_ip: {:union, [:boolean, :null]},
      is_proxied: {:union, [:boolean, :null]},
      is_served_by_pages: {:union, [:boolean, :null]},
      is_valid: :boolean,
      is_valid_domain: :boolean,
      nameservers: {:string, :generic},
      reason: {:union, [{:string, :generic}, :null]},
      responds_to_https: :boolean,
      should_be_a_record: {:union, [:boolean, :null]},
      uri: {:string, :generic}
    ]
  end
end
