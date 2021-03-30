defmodule SimNegGs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  #lista consumers
  @cl [:c1, :c2, :c3]
  #lista aziende
  @al [:a1, :a2, :a3]
  #negozio
  @ng :negozio

  alias SimNegGs.Consumatore, as: Consumatore
  alias SimNegGs.Azienda,     as: Azienda
  alias SimNegGs.Negozio,     as: Negozio

  use Application

  @impl true
  def start(_type, _args) do

    #genera la lista dei processi consumatori
    consumatori = Enum.map(@cl, fn cn ->
      %{ id: cn,
         start: {Consumatore, :start_link,
                  [
                    %Consumatore{cname: cn, shopPid: @ng},
                    [name: cn]
                  ]
                }
        }
      end )

    #genera la lista dei processi azienda
    aziende = Enum.map(@al, fn an ->
      %{ id: an,
         start: { Azienda, :start_link,
                  [
                    %Azienda{aname: an},
                    [name: an]
                  ]
                }
        }
       end )

    # processo negozio
    negozio  = [
      # questa è come se fosse la sola clausa start dell'altra notazione child
      # notate che nei casi precedenti passiamo due parametri in questo caso uno solo (tupla)
      {Negozio, {%Negozio{aPidL: @al},[name: @ng]}}
    ]

    children = negozio ++ consumatori ++ aziende |>
        IO.inspect(label: "childrens")

    # Starts a worker by calling: SimNegGs.Worker.start_link(arg)
    # {SimNegGs.Worker, arg}
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimNegGs.Supervisor]
    Supervisor.start_link(children, opts)

  end
end
