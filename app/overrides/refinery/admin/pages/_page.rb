Deface::Override.new(virtual_path: 'refinery/admin/pages/_page',
                    name: 'replace_new_child_page_link',
                    replace: "erb[loud]:contains('refinery.new_admin_page_path')",
                    text: "<%= link_to refinery_icon_tag('page_add.png'), refinery.list_widgets_admin_templates_path(:dialog => true, :parent_id => page.id), :title => t('new', :scope => 'refinery.admin.pages') %>",
                    original: "<%= link_to refinery_icon_tag('page_add.png'), refinery.new_admin_page_path(:parent_id => page.id), :title => t('new', :scope => 'refinery.admin.pages') %>")
