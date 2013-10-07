module Refinery
  module Widgets
    module WidgetsHelper

      def widget_type_fields(type, template_part_form_builder)
        widget = Widget.new(sub_type: type.klass)
        widget.send("#{type.association_name}=", type.klass.new)
        fields = template_part_form_builder.fields_for(:widgets, widget) do |builder|
          render("widget_fields", f: builder, type: type)
        end
        content_tag :div, '', data: {id: type.html_id, fields: fields.gsub("\n", "")}
      end

      def render_page_part(page, part)
        ret = ''
        page.parts.find_by_title(part).widgets.where(display: true).each do |widget|
          ret += render("refinery/widgets/#{widget.widget_type.front_partial}", :widget => widget)
        end
        raw ret
      end
      
      def call_widget_helpers(page)                                                                                                                                                                            
        if page
          page.widgets.each do |w|                                                                                                                                                                               
            eval w.ultimate_widget_type.association_name                                                                                                                                                         
          end                                                                                                                                                                                                    
        end
      end 

    end
  end
end

::ApplicationController.send(:helper, Refinery::Widgets::WidgetsHelper)
::ApplicationController.send(:include, Refinery::Widgets::WidgetsHelper)
::Refinery::AdminController.send(:helper, Refinery::Widgets::WidgetsHelper)
::ActionView::Base.send(:include, Refinery::Widgets::WidgetsHelper)
