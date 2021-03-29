defmodule SimNegGs.Azienda do
  @moduledoc """
  modulo genserver che gestisce l'azienda
  """
  #ritardo massimo consegna ordine al negozio
  @rco 20

  use GenServer

  # struct per la gestione dello stato del server
  defstruct [aname: nil, pidShop: nil]

  #
  # interfaccia client
  #

  # inizializzazione processo

  def start_link({state, opts}) do
    state|> IO.inspect(label: "initialization state")
    opts|> IO.inspect(label: "initialization opts")
    GenServer.start_link(__MODULE__, state, opts)
  end

  # riceve ordine dal negozio


  #
  # interfaccia server
  #

  #inizializzazione processo
  @impl true
  @spec init(any) :: {:ok, any}
  def init(state) do
    {:ok, state}
  end

  # riceve ordine dal negozio ed invia la merce
  @impl true
  def handle_cast(_msg, state) do
    {:noreply, state}
  end

end
