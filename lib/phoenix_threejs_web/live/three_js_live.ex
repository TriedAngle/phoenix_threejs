defmodule PhoenixThreejsWeb.ThreeJsLive do
  use Phoenix.LiveView

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Running ThreeJS</h1>
    <div id="three-container" phx-hook="ThreeExample" phx-update="ignore"></div>
    """
  end
end
