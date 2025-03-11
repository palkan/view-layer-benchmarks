# frozen_string_literal: true

require './renderers.rb'

Benchmark.ips do |x|
  x.time = 10
  x.warmup = 2

  if ENV["TYPE"] == "cables"
    Renderers.cable_renderers.each do |renderer, render_function|
      x.report(renderer.to_s) { render_function.call() }
    end
  else
    Renderers.recursive_renderers.each do |renderer, render_function|
      x.report(renderer.to_s) { render_function.call() }
    end
  end

  x.compare!
end
