require 'erubis'
require 'rulers/file_model'
require 'rack/request'

module Rulers
  class Controller
    include Rulers::Model
    # Question - why is this this first pry that get's hit, instead of something in routing?
    
    def response(text, status = 200, headers = {})
      raise "Already responded" if @response
      a = [text].flatten
      @response = Rack::Response.new(a, status, headers)
    end
    
    def request
      @request ||= Rack::Request.new(@env)
    end

    def params
      request.params
    end    

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ""
      Rulers.to_underscore klass
    end

    def render(view_name, locals = {})
      filename = File.join "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(env: env)
    end

    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
