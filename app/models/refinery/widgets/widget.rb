module Refinery
  module Widgets
    class Widget < Refinery::Core::BaseModel
      
      belongs_to :container, polymorphic: true
      belongs_to :widget, class_name: 'Refinery::Widgets::Widget'
      accepts_nested_attributes_for :widget


      attr_accessor :widget_attributes

      validate :validate_widget

      validates :name, :presence => {:if => Proc.new{|o| o.reuse? }}

      before_validation :update_widget

      def self.reusable
        where(widget_id: nil, reuse: true)
      end
      
      def self.has_name
        where(["name != ? AND name IS NOT NULL", ''])
      end

      def self.on_page
        where(container_type: 'Refinery::PagePart')
      end

      def self.on_template
        where(container_type: 'Refinery::Widgets::TemplatePart')
      end

      def widget_type
        WidgetType.find(sub_type)
      end

      def ultimate_widget_type
        widget ? widget.ultimate_widget_type : widget_type
      end

      def sub_type_instance
        self.send(widget_type.association_name)
      end

      def deep_dup
        ret = self.dup
        sub_type_copy = self.sub_type_instance.dup
        ret.send("#{self.widget_type.association_name}=", sub_type_copy)
        ret
      end

      def dup_by_ref
        ret = Widget.new
        ret.widget = self
        ret.sub_type = self.class.to_s
        ret.name = self.name
        ret
      end

      def on_page?
        container_type == 'Refinery::PagePart'
      end

      def on_template?
        container_type == 'Refinery::Widgets::TemplatePart'
      end

      def templates
        ret = []
        ret << self.container.template if self.on_template? && self.container
        Widget.where(widget_id: self.id).each do |w|
          ret << w.container.template if w.on_template? && w.container
        end
        ret
      end
    
      def pages
        ret = []
        ret << self.container.page if self.on_page? && self.container
        Widget.where(widget_id: self.id).each do |w|
          ret << w.container.page if w.on_page? && w.container
        end
        ret
      end

      def times_used
        if widget
          widget.times_used
        elsif new_record?
          0
        else
          Widget.where(widget_id: id).count + 1
        end
      end

      private
        
        def update_widget
          widget.attributes = @widget_attributes if widget && @widget_attributes
        end

        def validate_widget
          widget.valid? if widget
        end

    end
  end
end
