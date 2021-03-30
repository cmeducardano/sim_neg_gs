defmodule SimNegGs.Consumatore do
  @moduledoc """
  gestisce la simulazione del comportamento dei consumatori
  bla ... bla...
  """

  #frequenza consumo 5s
  @fc 5000
  #timeout per richiedere licenziamento direttore
  @tld 10

  use GenServer

  # struct per la gestione dello stato del server

  defstruct [cname: nil, shopPid: nil, delay: @fc, n: 3]

  ##########
  # client #
  ##########

  # inizializzazione processo

  def start_link(state, opts) do
    state|> IO.inspect(label: "initialization state client")
    opts |> IO.inspect(label: "initialization opts")
    GenServer.start_link(__MODULE__, state, opts)
  end

  # riceve consegna dall'azienda

  def consegna(spid, msg) do
      GenServer.cast(spid, msg)
  end


  ##########
  # server #
  ##########

  # inizializzazione processo

  @impl true
  def init(state) do
    state|> IO.inspect(label: "initialization state server")
    # schedula un messaggio di tipo :consume a sè stesso dopo un timeout ct
    # Process.send_after(self(), :consume, @fc )

  {:ok, state}
  end

  # riceve il messaggio :consume
  # se ci sono le condizioni effettua l'ordine al negozio
  @impl true
  def handle_info(:consume, {spid}) do
    # invia ordine al negozio
    #setta timeout per la risposta del negozio @tld
  {:noreply, {spid}, @tld}
  end

  # se l'ordine non viene consegnato per tempo dal negozio
  # invia al negozio la richiesta di licenziare il direttore
  @impl true
  def handle_info(:timeout, {spid}) do
    # gestisce il timeout attivato dall'ordine al negozio
    # chiede il licenziamento del direttore
  {:noreply, {spid}}
  end

  # riceve l'ordine dal negozio
  @impl true
  def handle_cast({}, {spid, ct, cf}) do
    #processa prodotto ricevuto dal negozio
    #attiva il timeout per il prossimo consumo
    Process.send_after(self(), :consume, ct)
    {:noreply, {spid, ct, cf}}
  end

end
