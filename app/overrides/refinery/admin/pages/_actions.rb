Deface::Override.new(virtual_path: 'refinery/admin/pages/_actions',
                    name: 'replace_new_page_link',
                    replace: "erb[loud]:contains('refinery.new_admin_page_path')",
                    text: "<%= link_to t('.create_new_page'), refinery.list_widgets_admin_templates_path(dialog: true), :class => \"add_icon\", :title => 'Select a template' %>",
                    original: "<%= link_to t('.create_new_page'), refinery.new_admin_page_path, :class => \"add_icon\" %>")
