begin
  # Try to require the preresolved locked set of gems.
  require ::File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require 'sinatra'

Sinatra::Application.set(
  :run => false,
  :environment => ENV['RACK_ENV']
)

require 'gotd'
run Sinatra::Application
