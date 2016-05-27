require Logger
defmodule OpencvThumbnailServer do
  use Application
  def start(_type, _args) do
    Logger.info "Start opencv thumbnail server"
    :erlang.set_cookie(node, :"&!CQMYY$_123+_-*%#ELIXIR.APPLICATION")
    OpencvThumbnailServer.Supervisor.start_link()
  end
end
