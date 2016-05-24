# How to


```
worker = :poolboy.checkout(:opencv_thumbnail_server_pool)
data = OpencvThumbnailServer.Worker.call_python(
  worker,
  :load_image_url,
  ["http://ww3.sinaimg.cn/mw690/6941baebgw1epzcuv9vmxj20me0hy0u1.jpg"]
)
File.write("/tmp/6941baebgw1epzcuv9vmxj20me0hy0u1.jpg", data)
:poolboy.checkin(:opencv_thumbnail_server_pool, worker)
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add opencv_thumbnail_server to your list of dependencies in `mix.exs`:

        def deps do
          [{:opencv_thumbnail_server, "~> 0.0.1"}]
        end

  2. Ensure opencv_thumbnail_server is started before your application:

        def application do
          [applications: [:opencv_thumbnail_server]]
        end

