# How to

Get image width and height

```
iex> {:ok, data} = OpencvThumbnailServer.Api.load_image_url("http://ww3.sinaimg.cn/mw690/6941baebgw1epzcuv9vmxj20me0hy0u1.jpg")
{:ok, <<255, 216, 255, 224, ...>>}
iex> OpencvThumbnailServer.Api.get_dimension(data)
{:ok, {256, 256}}
```

## Installation

The project is in early development stage, there's no package available in hex. you must install the deps with git repo.

  1. Add opencv_thumbnail_server to your list of dependencies in `mix.exs`:

        def deps do
          [{:opencv_thumbnail_server, github: "developerworks/opencv_thumbnail_server"}]
        end

  2. Ensure opencv_thumbnail_server is started before your application:

        def application do
          [applications: [:opencv_thumbnail_server]]
        end

## OpenCV Installation on Ubuntu
http://www.pyimagesearch.com/2015/06/22/install-opencv-3-0-and-python-2-7-on-ubuntu/

## OpenCV Installation on Mac OSX
http://www.mobileway.net/2015/02/14/install-opencv-for-python-on-mac-os-x/
