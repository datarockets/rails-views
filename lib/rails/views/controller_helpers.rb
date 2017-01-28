module Rails
  class Views
    module ControllerHelpers
      def self.included(base)
        # Protect from trying to augment modules that appear
        # as the result of adding other gems.
        return if base != ActionController::Base

        base.class_eval do
          alias_method_chain :render, :cells
        end
      end

      def self.prepended(base)
        return if base != ActionController::Base

        base.class_eval do
          alias_method :render_without_cells, :render

          def render(options = nil, *args, &block)
            render_with_cells(options, *args, &block)
          end
        end
      end

      def render_with_cells(options = nil, *args, &block)
        if options.is_a?(Hash) && options.key?(:cell)
          normalize_options = _normalize_render(options, *args)
          cell_path = find_cell_path(normalize_options)

          render html: call_cell(cell_path, normalize_options), layout: normalize_options[:layout]
        else
          render_without_cells(options, *args, &block)
        end
      end

      private

      def find_cell_path(options)
        cell_prefix_path = options[:prefixes].try(:first)
        passed_cell = options[:cell]

        if (passed_cell == true) && cell_prefix_path
          cell_prefix_path + cell_postfix_path
        elsif passed_cell.is_a?(Symbol) && cell_prefix_path
          cell_prefix_path + '/' + passed_cell.to_s + cell_postfix_path
        else
          passed_cell + cell_postfix_path
        end
      end

      def call_cell(cell_path, options)
        cell_options = options[:options] || {}

        concept(cell_path, options[:model], cell_options)
      end

      def cell_postfix_path
        '/cell'
      end
    end
  end
end
