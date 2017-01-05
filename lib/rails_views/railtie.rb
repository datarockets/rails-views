require 'rails_views/controller_helpers'

class RailsViews
  if defined?(Rails)
    if Rails::VERSION::MAJOR >= 5

      class RailsViewsRailtie < Rails::Railtie
        initializer 'rails_views.register' do |_app|
          ActionController::Base.send :prepend, ControllerHelpers
        end
      end

    elsif Rails::VERSION::MAJOR == 4

      class RailsViewsRailtie < Rails::Railtie
        initializer 'rails_views.register' do |_app|
          ActionController::Base.send :include, ControllerHelpers
        end
      end
    end
  end
end
