class AddTemplateIdToRefineryPages < ActiveRecord::Migration

  def up
    add_column :refinery_pages, :template_id, :integer

  end

  def down
    remove_column :refinery_pages, :template_id

  end

end
