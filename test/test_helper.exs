if System.get_env("CI") do
  ExUnit.configure(formatters: [JUnitFormatter])
end

ExUnit.start()
