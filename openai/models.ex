defmodule Models do
  @moduledoc """
  Provides API endpoints related to models
  """

  @default_client Client

  @doc """
  Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
  """
  @spec delete_model(model :: String.t(), opts :: keyword) ::
          {:ok, DeleteModelResponse.t()} | :error
  def delete_model(model, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [model: model],
      call: {Models, :delete_model},
      url: "/models/#{model}",
      method: :delete,
      response: [{200, {DeleteModelResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Lists the currently available models, and provides basic information about each one such as the owner and availability.
  """
  @spec list_models(opts :: keyword) :: {:ok, ListModelsResponse.t()} | :error
  def list_models(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Models, :list_models},
      url: "/models",
      method: :get,
      response: [{200, {ListModelsResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
  """
  @spec retrieve_model(model :: String.t(), opts :: keyword) :: {:ok, Model.t()} | :error
  def retrieve_model(model, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [model: model],
      call: {Models, :retrieve_model},
      url: "/models/#{model}",
      method: :get,
      response: [{200, {Model, :t}}],
      opts: opts
    })
  end
end
