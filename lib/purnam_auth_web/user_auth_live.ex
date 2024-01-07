defmodule PurnamAuthWeb.UserAuthLive do
  use Phoenix.LiveView

  alias PurnamAuth.Accounts

  def on_mount(:user, params, %{"user_token" => user_token} = _session, socket) do

    socket =
      socket
      |> assign(:current_user, Accounts.get_user_by_session_token(user_token))
    if socket.assigns.current_user do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/login")}
    end
  end


  def on_mount(:admin, params, %{"user_token" => user_token} = _session, socket) do
    IO.inspect(socket, label: "1socket")
    socket =
      socket
      |> assign(:current_user, Accounts.get_user_by_session_token(user_token))

      IO.inspect(socket, label: "2socket")

    if socket.assigns.current_user.admin do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/form")}
    end
  end
end
