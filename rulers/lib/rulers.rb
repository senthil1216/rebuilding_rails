# frozen_string_literal: true

require 'rulers/version'
require 'rulers/routing'
require 'pry'

module Rulers

  class Application
    HTML_CONTENT_TYPE = { 'Content-Type' => 'text/html' }.freeze
    def get_path_info(env)
      _, cont, action, =
        env['PATH_INFO'].split('/', 4)
      [cont, action]
    end

    def call(env)
      cont, action = get_path_info env
      return [302, { 'Location' => '/quotes/a_quote' }, []] if cont.nil? || cont.empty?

      klass, act = get_controller_and_action(cont, action)
      controller = klass.new(env)
      text = controller.send(act)
      [200, { 'Content-Type' => 'text/html' },
       [text]]
    rescue StandardError => e
      [500,
       { 'Content-Type' => 'text/html' },
       ['An Generic Exception occurred']
      ]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
