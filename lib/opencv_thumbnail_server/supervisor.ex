defmodule OpencvThumbnailServer.Supervisor do
  use Supervisor

  @config Application.get_env :opencv_thumbnail_server, :settings

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    pool_options = @config[:poolboy]
    {_, name} = pool_options[:name]
    children = [
      :poolboy.child_spec(name, pool_options, @config[:module_name])
    ]
    supervise(children, strategy: :one_for_all, max_restarts: 1000, max_seconds: 3600)
  end
end
