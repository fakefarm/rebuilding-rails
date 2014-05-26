require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"
    assert last_response.ok?
    body = last_response.body
    assert body["hello"]
  end
end


# Questions
# How did body know "Hello?"
# How die test_request get fired?
# What is Rack doing?
# What are Rack test methods?
