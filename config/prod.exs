use Mix.Config

config :kernel, distributed: [{:opencv_thumbnail_server, 5000, [
  :"node1@192.168.212.45",
  :"node2@192.168.212.45",
  :"node3@192.168.212.45",
  :"node4@192.168.212.45",
  :"node5@192.168.212.45"
]}]

config :kernel, inet_dist_listen_min: 9100

config :kernel, inet_dist_listen_max: 9105

config :kernel, sync_nodes_mandatory: [
  :"node2@192.168.212.45",
  :"node3@192.168.212.45"
]
config :kernel, sync_nodes_optional: [
  :"node4@192.168.212.45",
  :"node5@192.168.212.45"
]

config :kernel, sync_nodes_timeout: 10000
