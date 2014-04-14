require 'rspec/expectations'
require 'test/unit'
require 'rack/test'
require "net/http"
require "uri"

class TestRequestsToBabyCMS < Test::Unit::TestCase
    include Rack::Test::Methods

  def run_test_without_server(route, expectedResult)
    require_relative '../src/BabyCMS1.rb'
    app = BabyCMS.new
    response = app.call(Rack::MockRequest.env_for(route, {}))
    body = response[2].body
    result = body[0]
    result.should == expectedResult

  end

  def run_test_with_server(route, expectedResult)
    require 'Sinatra'
    require_relative '../src/handle_thru_sinatra'
    def app
      Sinatra::Application
    end
    get route
    body = last_response.body
    body.should == expectedResult
  end

  def test_00_hello_without_server
    run_test_without_server('/', "Hi from Alistair")
  end

  def test_01_hello_with_server
    run_test_with_server('/', "Hi from Alistair")
  end

end
