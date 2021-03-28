defmodule SimNegGs.Negozio do
  @moduledoc """
  bla bla bla
  """

  use GenServer

  # struct per la gestione dello stato del server

  defstruct [cname: nil, shopPid: nil, delay: 5, n: 3]

  ##########
  # Client #
  ##########

  # inizializzazione processo
  def start_link(state, opts) do
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
