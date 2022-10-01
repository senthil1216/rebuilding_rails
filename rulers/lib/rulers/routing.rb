module Rulers
  class Application

    def get_controller_and_action(cont, action)
      cont = cont.capitalize # "People"
      cont += 'Controller' # "PeopleController"
      [Object.const_get(cont), action]
    rescue StandardError => e
    end
  end
end