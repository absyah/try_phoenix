# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :try_phoenix,
  ecto_repos: [TryPhoenix.Repo]

# Configures the endpoint
config :try_phoenix, TryPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ngd1BzfBEgCNMXZRWKbR90ampoMxHPzqXmPmoQ2X2tfv7r2Rt9T4emsemRALAPXW",
  render_errors: [view: TryPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TryPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
