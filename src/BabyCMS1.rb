require 'rack'
require_relative 'handle_get'

class BabyCMS
  def call(env)
    req  = Rack::Request.new(env)
    if req.get? then handle_get(req); end
  end
end
