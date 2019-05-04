require "station_signage/version"
require "active_support/configurable"

module StationSignage
  class Error < StandardError; end

  class Railtie < ::Rails::Railtie
    initializer 'station_signage' do
      ActiveSupport.on_load(:after_initialize) do
        require "g"
        Rails::Application::ApplicationController.class_eval do
          before_action { g "#{self.class.name}##{action_name}" }
        end

      end
    end
  end
end
