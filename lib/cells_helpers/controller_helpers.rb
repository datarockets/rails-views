class CellsHelpers
  module ControllerHelpers
    def self.included(base)
      # Protect from trying to augment modules that appear
      # as the result of adding other gems.
      return if base != ActionController::Base

      base.class_eval do
        alias_method_chain :render, :cells
        # alias_method_chain :render_to_string, :cells
      end
    end

    def self.prepended(base)
      # Protect from trying to augment modules that appear
      # as the result of adding other gems.
      return if base != ActionController::Base

      base.class_eval do
        alias_method :render_without_cells, :render
        # alias_method :render_to_string_without_cells, :render_to_string

        def render(options = nil, *args, &block)
          render_with_cells(options, *args, &block)
        end

        # def render_to_string(options = nil, *args, &block)
        #   render_to_string_with_cells(options, *args, &block)
        # end
      end
    end

    def render_with_cells(options = nil, *args, &block)
      if options.is_a?(Hash) && options.key?(:cell)
        binding.pry
        render nothing: true
      else
        render_without_cells(options, *args, &block)
      end
    end
  end
end
