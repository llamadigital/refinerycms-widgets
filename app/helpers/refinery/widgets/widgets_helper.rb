module Refinery
  module Widgets
    module WidgetsHelper

      def link_to_add_fields(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render(association.to_s.singularize + "_fields", f: builder)
        end
        link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
      end

      def link_to_remove_field(label, builder)
        ret = ''
        ret += builder.hidden_field :_destroy, :class => 'destroy'
        ret += link_to_function label, 'removeField(this)'
        raw ret
      end
      
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

    end
  end
end

::ApplicationController.send(:helper, Refinery::Widgets::WidgetsHelper)
::Refinery::AdminController.send(:helper, Refinery::Widgets::WidgetsHelper)
::ActionView::Base.send(:include, Refinery::Widgets::WidgetsHelper)
