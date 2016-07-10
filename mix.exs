defmodule OpencvThumbnailServer.Mixfile do
  use Mix.Project

  def project do
    [app: :opencv_thumbnail_server,
     version: "0.0.5",
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
    [
      applications: [
        :logger,
        :poolboy,
        :erlport,
        :edeliver,
        :syn,
        :runtime_tools
      ] ++ dev_packages,
      mod: {OpencvThumbnailServer, []}
    ]
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
      {:apex, "~> 0.4.0", only: [:dev]},
      {:edeliver, ">= 1.2.10"},
      {:erlport, github: "hdima/erlport"},
      {:exrm, "~> 1.0.5"},
      {:exfswatch, "~> 0.1.1", override: true},
      {:exsync, "~> 0.1.2", only: [:dev]},
      {:poolboy, "~> 1.5"},
      {:syn, "~> 1.4"}
    ]
  end
end
