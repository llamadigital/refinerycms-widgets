module Refinery
  module Widgets
    module Admin
      class WidgetTypesController < ::Refinery::AdminController

        layout false

        def new_for_template
          set_template_and_template_part_and_widget
          @widget.send("#{@widget.widget_type.association_name}=", @widget.widget_type.klass.new)
        end
        
        def new_for_page
          set_page_and_page_part_and_widget
          @widget.send("#{@widget.widget_type.association_name}=", @widget.widget_type.klass.new)
        end

        def show_for_template
          set_template_and_template_part_and_widget
          widget = Widget.find(params[:id])
          @widget.send("#{@widget.widget_type.association_name}=", widget)
          @widget.locked = widget.locked
          @widget.name = widget.name
        end
       
        def show_for_page
          set_page_and_page_part_and_widget
          widget = Widget.find(params[:id])
          @widget.send("#{@widget.widget_type.association_name}=", widget)
          @widget.locked = widget.locked
          @widget.name = widget.name
        end

        private

          def set_template_and_template_part_and_widget
            @template_part_index = params[:index] if params[:index].present?
            @template = Template.new
            @template_part = @template.template_parts.build
            sub_type = params[:sub_type]
            @widget = @template_part.widgets.build(sub_type: sub_type)
          end
          
          def set_page_and_page_part_and_widget 
            @page_part_index = params[:index] if params[:index].present?
            @page = Page.new
            @page_part = @page.parts.build
            sub_type = params[:sub_type]
            @widget = @page_part.widgets.build(sub_type: sub_type)
          end

          def restrict_controller
            # no restrictions 
          end

      end
    end
  end
end
