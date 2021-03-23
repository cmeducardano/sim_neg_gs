defmodule SimNegGs.Consumatore do
  @moduledoc false



  use GenServer

  def start_link(state) do
    state |> IO.inspect(label: "Init Consumer state")
    GenServer.start_link(__MODULE__, state, "")
  end

  def init(_opts) do
    {:ok, %{}}
  end

  def handle_call(_msg, _from, state) do
    {:reply, :ok, state}
  end

  def handle_cast(_msg, state) do
    {:noreply, state}
  end
end
