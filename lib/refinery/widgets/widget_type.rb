module Refinery
  module Widgets
    class WidgetType

      attr_reader :name, :klass, :html_id, :association_name, :admin_partial,
        :klass_as_string, :attribute_param, :admin_preview_partial,
        :front_partial

      def initialize(class_as_string)
        @klass_as_string = class_as_string
        @klass = class_as_string.constantize
        @html_id = class_as_string.split('::').last.underscore
        @association_name = @html_id
        @attribute_param = "#{@association_name}_attributes"
        @admin_partial = @html_id
        @admin_preview_partial = "#{@html_id}_preview"
        @front_partial = @html_id
        @name = @html_id.humanize
      end

      def self.all
        Refinery::Widgets.config[:base_widgets].collect{|w| self.new(w) }
      end

      def self.find(class_as_string)
        self.new(class_as_string)
      end
    end
  end
end
