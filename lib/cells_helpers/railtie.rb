require 'cells_helpers/controller_helpers'

class CellsHelpers
  if defined?(Rails)
    if Rails::VERSION::MAJOR >= 5

      class CellsHelpersRailtie < Rails::Railtie
        initializer 'cells_helpers.register' do |_app|
          ActionController::Base.send :prepend, ControllerHelpers
        end
      end

    elsif Rails::VERSION::MAJOR == 4

      class CellsHelpersRailtie < Rails::Railtie
        initializer 'cells_helpers.register' do |_app|
          ActionController::Base.send :include, ControllerHelpers
        end
      end
    end
  end
end
