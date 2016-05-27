require Logger
defmodule OpencvThumbnailServer.Worker do
  use GenServer
  @config Application.get_env(:opencv_thumbnail_server, :settings)


  def start_link(python_module) do
    GenServer.start_link(__MODULE__, python_module, [])
  end

  def call_python(worker, function, args) do
    GenServer.call(worker, {:call_python, function, args}, 10_000)
  end

  def init(python_module) do
    {:ok, pid} = :python.start_link([
      {:python_path, @config[:python_path]},
      {:python, @config[:python]}
    ])
    Logger.info "Start worker #{inspect pid}"
    state = {python_module, pid}
    {:ok, state}
  end

  def handle_call({:call_python, function, args}, _from, state) do
    {module, pid} = state
    result = :python.call(pid, module, function, args)
    reply = {:ok, result}
    {:reply, reply, state}
  end

  def handle_call(_request, _from, state) do
    {:stop, :error, :bad_call, state}
  end

  def handle_info(_msg, {module,py_pid}) do
    {:stop, :error, {module,py_pid}}
  end

  def terminate(_reason, {_, py_pid}) do
    :python.stop(py_pid)
    :ok
  end

end
