text = <<-eos
<% if Refinery::Widgets::Template.count > 1 %>
  <%= link_to refinery_icon_tag('page_add.png'), refinery.list_widgets_admin_templates_path(:dialog => true, :parent_id => page.id), :title => t('new', :scope => 'refinery.admin.pages') %>
<% else %>
  <%= link_to refinery_icon_tag('page_add.png'), refinery.new_admin_page_path(:template_id => Refinery::Widgets::Template.first.try(:id), :parent_id => page.id), :title => t('new', :scope => 'refinery.admin.pages') %>
<% end %>
eos

Deface::Override.new(virtual_path: 'refinery/admin/pages/_page',
                    name: 'replace_new_child_page_link',
                    replace: "erb[loud]:contains('refinery.new_admin_page_path')",
                    text: text,
                    original: "<%= link_to refinery_icon_tag('page_add.png'), refinery.new_admin_page_path(:parent_id => page.id), :title => t('new', :scope => 'refinery.admin.pages') %>")

text = <<-eos
  <span class='template label'><%= page.template.try(:name) || 'No template' %></span>
eos

Deface::Override.new(virtual_path: 'refinery/admin/pages/_page',
                    name: 'add_template_name',
                    insert_after: "erb[loud]:contains('page_meta_information')",
                    text: text)

