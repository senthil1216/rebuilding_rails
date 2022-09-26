# frozen_string_literal: true

require 'rulers/version'

module Rulers
  class Application
    HTML_CONTENT_TYPE = { 'Content-Type' => 'text/html' }

    def call(_env)
      [
        200,
        HTML_CONTENT_TYPE,
        ['Hello from Ruby on Rulers']
      ]
    end
  end
end
