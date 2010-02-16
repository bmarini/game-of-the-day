require 'sinatra'
Sinatra::Application.set(
  :run => false,
  :environment => ENV['RACK_ENV']
)

require 'gotd'
run Sinatra::Application
