# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :home_ui,
  ecto_repos: [HomeUi.Repo],
  hue_username: "gDI0bPg3fPd1j-15UUDjpd-pMiQC04DC4qGrFoDg"

# Configures the endpoint
config :home_ui, HomeUiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p3cmWYoXBXvf8MofAg04cbFv7SW1y+QeZOUeE2MMqpn2YNrlsASSPH/YhxBsA//2",
  render_errors: [view: HomeUiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HomeUi.PubSub,
  live_view: [signing_salt: "6LmsLAxM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
