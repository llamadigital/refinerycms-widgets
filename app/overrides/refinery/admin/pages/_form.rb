Deface::Override.new(virtual_path: 'refinery/admin/pages/_form',
                    name: 'insert_template_id_field_to_pages_admin_form',
                    insert_after: "erb[loud]:contains('form_for')",
                    text: "<%= f.hidden_field :template_id -%>")

Deface::Override.new(virtual_path: 'refinery/admin/pages/_form',
                    name: 'remove_preview_and_continue_links',
                    replace: "erb[loud]:contains('admin/form_actions')",
                    partial: 'refinery/admin/pages/form_actions')

Deface::Override.new(virtual_path: 'refinery/admin/pages/_form',
                    name: 'insert_template_changer',
                    insert_after: "erb[loud]:contains('admin/locale_picker')",
                    partial: 'refinery/admin/pages/template_changer')
