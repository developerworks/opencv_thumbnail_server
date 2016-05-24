require Logger
defmodule OpencvThumbnailServer do
  use Application
  def start(_type, _args) do
    Logger.info "Start opencv thumbnail server"
    OpencvThumbnailServer.Supervisor.start_link()
  end
end
