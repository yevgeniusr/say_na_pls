defmodule HelloWeb.UserSocket do
  use Phoenix.Socket

  # def handle_info(:create_org, socket) do
  #   # {:ok, org} = HelloWeb.create_org()
  #   send(self(), {:create_repo, 1})
  #   {:noreply, assign(socket, deploy_step: "Creating GitHub org...")}
  # end

  # def handle_info({:create_repo, org}, socket) do
  #   {:ok, repo} = HelloWeb.create_repo(org)
  #   send(self(), {:push_contents, repo})
  #   {:noreply, assign(socket, deploy_step: "Creating GitHub repo...")}
  # end

  # def handle_info({:push_contents, repo}, socket) do
  #   :ok = HelloWeb.push_contents(repo)
  #   send(self(), :done)
  #   {:noreply, assign(socket, deploy_step: "Pushing to repo...")}
  # end

  # def handle_info(:done, socket) do
  #   {:noreply, assign(socket, deploy_step: "Done!")}
  # end

  ## Channels
  # channel "room:*", HelloWeb.RoomChannel

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     HelloWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
