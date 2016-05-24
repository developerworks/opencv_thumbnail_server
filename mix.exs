defmodule OpencvThumbnailServer.Mixfile do
  use Mix.Project

  def project do
    [app: :opencv_thumbnail_server,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    dev_packages = Mix.env == :dev && [:exsync, :apex] || []
    [applications: [:logger, :poolboy, :erlport] ++ dev_packages,
     mod: {OpencvThumbnailServer, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poolboy, "~> 1.5"},
      {:erlport, github: "hdima/erlport"},
      {:exsync, "~> 0.1.2", only: [:dev]},
      {:apex, "~> 0.4.0", only: [:dev]},
      {:exrm, "~> 1.0.4"}
    ]
  end
end
