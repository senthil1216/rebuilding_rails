require 'rulers'

module BestQuotes
  class Application < Rulers::Application
    def call(_env)
      super => [status_code, response_type, [body]]
      [status_code, response_type, ["#{body} - And from Best Quotes retrieval"]]
    end
  end
end
