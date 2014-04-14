# send all HTTP GET requests here
require 'rack'

# expect Rack::Request, return Rack::Response
def handle_get( req )
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  response.write "Hi from Alistair"
  response.finish
end



