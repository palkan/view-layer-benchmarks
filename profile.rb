require_relative "./renderers.rb"

require "vernier"

target = ENV.fetch("TARGET", "view_component")

renderer = Renderers.cable_renderers.fetch(target.to_sym)

# warmup
renderer.call()

Vernier.profile(out: "tmp/profile-#{target}.json") do
  10.times { renderer.call() }
end
