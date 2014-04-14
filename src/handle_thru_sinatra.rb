require 'sinatra'
require_relative 'handle_get'

get '*' do
  response = handle_get(request);
  out = response[2].body
end


