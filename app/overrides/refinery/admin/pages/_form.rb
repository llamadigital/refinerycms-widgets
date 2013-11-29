Deface::Override.new(virtual_path: 'refinery/admin/pages/_form',
                    name: 'insert_template_id_field_to_pages_admin_form',
                    insert_after: "erb[loud]:contains('form_for')",
                    text: "<%= f.hidden_field :template_id -%>")
