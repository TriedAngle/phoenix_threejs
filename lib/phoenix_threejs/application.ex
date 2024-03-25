defmodule PhoenixThreejs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixThreejsWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:phoenix_threejs, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixThreejs.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixThreejs.Finch},
      # Start a worker by calling: PhoenixThreejs.Worker.start_link(arg)
      # {PhoenixThreejs.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixThreejsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixThreejs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixThreejsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
