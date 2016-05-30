require Logger

defmodule OpencvThumbnailServer.ExitCallback do
  def callback_on_process_exit(key, pid, meta, reason) do
    Logger.debug "Process with Key #{inspect key}, Pid #{inspect pid} and Meta #{inspect meta} exited with reason #{inspect reason}"
  end
end
