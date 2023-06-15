defmodule QuickExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      QuickExampleWeb.Telemetry,
      # Start the Ecto repository
      QuickExample.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: QuickExample.PubSub},
      # Start Finch
      {Finch, name: QuickExample.Finch},
      # Start the Endpoint (http/https)
      QuickExampleWeb.Endpoint
      # Start a worker by calling: QuickExample.Worker.start_link(arg)
      # {QuickExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: QuickExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    QuickExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
