module Refinery
  module Widgets
    module ActsAsWidget

      extend ActiveSupport::Concern

      included do
      end

      module ClassMethods
        def acts_as_widget(options={})
          widget_type = WidgetType.find(self.to_s)
          self.class_eval do
            belongs_to :widget, class_name: 'Refinery::Widgets::Widget'
            ApplicationController.class_eval do
              define_method widget_type.association_name, Proc.new{}
            end
          end
          Widget.class_eval do
            has_one widget_type.association_name.to_sym, class_name: widget_type.klass_as_string, dependent: :destroy
            accepts_nested_attributes_for widget_type.association_name.to_sym
          end
        end
      end

    end
  end
end

ActiveRecord::Base.send :include, Refinery::Widgets::ActsAsWidget
