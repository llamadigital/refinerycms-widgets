Deface::Override.new(virtual_path: 'refinery/admin/pages/_form_page_parts',
                    name: 'replace_page_parts_with_widget_page_parts',
                    replace: "code[erb-loud]:contains('page_part_field')",
                    text: "<%= render 'page_part_field', :part => p.object, :part_index => (part_index += 1), :new_part => @page.new_record?, :f => p -%>",
                    original: "<%= render 'page_part_field', :part => p.object, :part_index => (part_index += 1), :new_part => @page.new_record? -%>")
