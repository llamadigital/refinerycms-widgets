Deface::Override.new(virtual_path: 'refinery/admin/pages/_form_advanced_options',
                    name: 'insert_template_id_field_to_pages_admin_form',
                    replace: "erb[loud]:contains('f.text_field :link_url')",
                    partial: "refinery/admin/pages/link_url")
