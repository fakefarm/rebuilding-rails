require 'rulers/version'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'
require 'rulers/controller'
require 'rulers/file_model'


module Rulers
  class Application
    `echo debug > debug.txt`;
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        return [200, {'Content-Type' => 'text/html'}, ['the index page'] ]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'},
        [ text ]]
    end
  end
end
