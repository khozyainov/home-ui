defmodule HomeUi.Hue do
  use GenServer

  def start_link(_) do
    username = Application.get_env(:home_ui, :hue_username)
    GenServer.start_link(__MODULE__, [username], name: __MODULE__)
  end

  def init(username) do
    bridge = authorize(username)
    {:ok, bridge}
  end

  # API

  def lights() do
    GenServer.call(__MODULE__, :lights)
  end

  def turn_on(id) do
    GenServer.cast(__MODULE__, {:turn_on, id})
  end

  def turn_off(id) do
    GenServer.cast(__MODULE__, {:turn_off, id})
  end

  # Callbacks

  def handle_call(:lights, _, bridge) do
    lights = Huex.lights(bridge)
    {:reply, lights, bridge}
  end

  def handle_cast({:turn_on, id}, bridge) do
    bridge = Huex.turn_on(bridge, id)
    {:noreply, bridge}
  end

  def handle_cast({:turn_off, id}, bridge) do
    bridge = Huex.turn_off(bridge, id)
    {:noreply, bridge}
  end

  # Privates

  defp authorize(username) do
    Huex.Discovery.discover()
    |> List.first()
    |> Huex.connect(username)
  end
end
