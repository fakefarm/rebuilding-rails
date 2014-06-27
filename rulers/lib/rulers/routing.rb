module Rulers
  class Application
    def get_controller_and_action(env)
      _, const, action, after = env["PATH_INFO"].split('/', 4)
      const = const.capitalize
      const += "Controller"

      [Object.const_get(const), action]
    end
  end
end
