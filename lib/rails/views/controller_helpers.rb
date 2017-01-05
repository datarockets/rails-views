module Rails
  class Views
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
          normalize_options = _normalize_render(options, *args)
          cell_name = find_cell_name(normalize_options)
          render html: call_cell(cell_name, normalize_options), layout: normalize_options[:layout]
        else
          render_without_cells(options, *args, &block)
        end
      end

      private

      def find_cell_name(options)
        prefix_name = options[:prefixes].try(:first)
        postfix_name = '/cell'
        if (options[:cell] == true) && prefix_name
          prefix_name + postfix_name
        elsif options[:cell].is_a?(Symbol) && prefix_name
          prefix_name + '/' + options[:cell].to_s + postfix_name
        else
          options[:cell] + postfix_name
        end
      end

      def call_cell(cell_name, options)
        cell_options = options[:options] || {}
        concept(cell_name, options[:model], cell_options)
      end
    end
  end
end
