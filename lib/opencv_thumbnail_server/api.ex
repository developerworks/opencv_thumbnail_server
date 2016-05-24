defmodule OpencvThumbnailServer.Api do
  alias OpencvThumbnailServer.Worker

  def get_dimension(data) do
    worker = :poolboy.checkout(:opencv_thumbnail_server_pool)
    {w, h} = Worker.call_python(worker, :get_dimension, [data])
    :poolboy.checkin(:opencv_thumbnail_server_pool, worker)
    {w, h}
  end

  def load_image_url(url) do
    worker = :poolboy.checkout(:opencv_thumbnail_server_pool)
    image_bin = Worker.call_python(worker, :load_image_url, [url])
    :poolboy.checkin(:opencv_thumbnail_server_pool, worker)
    image_bin
  end
end
