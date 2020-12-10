defmodule HomeUiWeb.LightLive do
  use HomeUiWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        color: 32000,
        saturation: 100,
        light: 50
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div>
      <div class="p-16">
        <form phx-change="color-change">
          <input name="color-picker" type="range"
                class="color-picker"
                min="1" max="65536"
                value="<%= @color %>"
                phx-debounce="200" />
          <input name="saturation-picker" type="range"
                min="1" max="100"
                value="<%= @saturation %>"
                phx-debounce="200" />
          <input name="color-light" type="range"
                min="1" max="100"
                value="<%= @light %>"
                phx-debounce="200" />
        </form>
      </div>
      <div class="pallete h-24 w-24 ml-4 rounded-xl" style="background:hsl(<%= get_html_color(@color) %>, 100%, 50%);">
      </div>
    </div>
    """
  end

  def handle_event("color-change", %{"color-picker" => color}, socket) do
    color = String.to_integer(color)
    socket = assign(socket, :color, color)
    {:noreply, socket}
  end

  defp get_html_color(color) do
    round(color / 65536 * 360)
  end
end
