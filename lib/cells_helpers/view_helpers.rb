module CellsHelpers
  module ViewHelpers
    extend ActiveSupport::Concern

    def flash
      parent_controller.flash
    end

    def render_each_and_join(views)
      views.map{ |view| render(view) }.join
    end

    class_methods do
      def option(*array)
        array.each do |option|
          define_method(option) do
            options[option]
          end
        end
      end
    end
  end
end
