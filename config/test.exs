use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :earmark_dingus2, EarmarkDingus2.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :earmark_dingus2, EarmarkDingus2.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "earmark_dingus2_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
