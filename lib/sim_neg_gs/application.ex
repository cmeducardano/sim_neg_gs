defmodule SimNegGs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  #lista consumers
  @cl [:c1, :c2, :c3]
  #lista aziende
  @al [:a1, :a2, :a3]

  use Application

  @impl true
  def start(_type, _args) do
    children =
    [
      # Starts a worker by calling: SimNegGs.Worker.start_link(arg)
      # {SimNegGs.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimNegGs.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
