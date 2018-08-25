require "warden"

# require File.expand_path('../HelloWorld', __FILE__)
use Rack::Lint # gives more descriptive error messages when responses aren't valid

class HelloName
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, body = @app.call(env)
    p "#{@app.call(env)}"
    if env.include?'HTTP_X_MYNAME'
      body = ["hello #{env['HTTP_X_MYNAME']}"]
    end
    [status, headers, body]
  end
end

use HelloName
run -> env {[200, {"REQUEST_METHOD" => "GET"}, ["Hello World"]]}