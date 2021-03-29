defmodule SimNegGs.Negozio do
  @moduledoc """
  bla bla bla
  """
@cm 10

  use GenServer

  # struct per la gestione dello stato del server

  defstruct [cm: @cm, pm: @cm, pc: 0, aPidL: nil ]

  ##########
  # Client #
  ##########

  # inizializzazione processo
  def start_link({state, opts}) do
    state|> IO.inspect(label: "initialization state")
    opts|> IO.inspect(label: "initialization opts")
    GenServer.start_link(__MODULE__, state, opts)
  end

  ##########
  # server #
  ##########

  # inizializzazione processo
  @impl true
  def init(_opts) do
    {:ok, %{}}
  end

  # ........
  @impl true
  def handle_call(_msg, _from, state) do
    {:reply, :ok, state}
  end

  @impl true
  def handle_cast(_msg, state) do
    {:noreply, state}
  end
end
