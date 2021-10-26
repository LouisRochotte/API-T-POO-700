# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mini_project01,
  ecto_repos: [MiniProject01.Repo]

# Configures the endpoint
config :mini_project01, MiniProject01Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2TsgmCMyN5voHlaiV5TU3FTepOihkLxWY6RuDXk6LHfGPxbmP11b7k0EStpadTYZ",
  render_errors: [view: MiniProject01Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MiniProject01.PubSub,
  live_view: [signing_salt: "vrpKywgL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
