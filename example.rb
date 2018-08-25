class Example
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, body = @app.call(env)
    p env
    if env.include?'HTTP_X_MYNAME'
      body = ["hello #{env['HTTP_X_MYNAME']}"]
    end
    [status, headers, body]
  end
end