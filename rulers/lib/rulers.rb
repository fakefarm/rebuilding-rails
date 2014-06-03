require 'rulers/version'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'


module Rulers
  class Application
    `echo debug > debug.txt`;
    def call(env)
      require 'pry'; binding.pry
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

  class Controller
    # Question - why is this this first pry that get's hit, instead of something in routing?
    require 'pry'; binding.pry
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
