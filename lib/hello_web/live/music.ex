defmodule Music do
  use Ecto.Schema
  import Ecto.Changeset

  schema "music" do

  end

  def changeset(music, params \\ %{}) do
    music
    |> cast(params, [:id])
  end
end

defmodule HelloWeb.Music do
    use Phoenix.LiveView

    def mount(_session, socket) do
      {:ok, assign(socket, %{changeset: Music.changeset(%Music{}), music_id: "tf52mbGTB4o"})}
    end

    def render(assigns) do
      IO.inspect assigns
      HelloWeb.PageView.render("music.html", assigns)
    end

    def handle_event("github_deploy", _value, socket) do
      # :ok = HelloWeb.start_deploy()
      send(self(), :create_org)
      {:noreply, assign(socket, deploy_step: "Starting deploy...")}
    end

    def handle_event("save", %{"music" => music_params}, socket) do
      {:noreply, assign(socket, music_id: music_params["id"])}
    end
  end

