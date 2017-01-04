module CellsHelpers
  module ViewHelpers
    extend ActiveSupport::Concern

    def flash
      parent_controller.flash
    end

    def render_each_and_join(views)
      views.map { |view| render(view) }.join
    end

    class_methods do
      def option(*array)
        array.each do |option|
          define_method(option) do
            options[option]
          end
        end
      end

      def date_property(*array)
        options = array.pop if array.last.is_a?(Hash)
        options ||= {}
        array.each do |field|
          format = options[:format] || :default
          name = options[:prefix] ? "#{options[:prefix]}_#{field}" : field
          define_method(name) do
            I18n.l(model.send(field), format: format)
          end
        end
      end
    end
  end
end
