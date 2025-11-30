defmodule Mollie.OnboardingAPI do
  @moduledoc """
  Provides API endpoints related to onboarding api
  """

  @default_client Mollie.Client

  @doc """
  Get onboarding status

  Retrieve the onboarding status of the currently authenticated organization.
  """
  @spec get_onboarding_status(opts :: keyword) ::
          {:ok, Mollie.EntityOnboardingStatus.t()} | :error
  def get_onboarding_status(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.OnboardingAPI, :get_onboarding_status},
      url: "/onboarding/me",
      method: :get,
      response: [{200, {Mollie.EntityOnboardingStatus, :t}}],
      opts: opts
    })
  end

  @doc """
  Submit onboarding data

  **⚠️ We no longer recommend implementing this endpoint. Please refer to the Client Links API instead to kick off the
  onboarding process for your merchants.**

  Submit data that will be prefilled in the merchant's onboarding. The data you submit will only be processed when the
  onboarding status is `needs-data`.  
  Information that the merchant has entered in their dashboard will not be overwritten.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec submit_onboarding_data(body :: map, opts :: keyword) :: :ok | :error
  def submit_onboarding_data(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Mollie.OnboardingAPI, :submit_onboarding_data},
      url: "/onboarding/me",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{204, :null}],
      opts: opts
    })
  end
end
