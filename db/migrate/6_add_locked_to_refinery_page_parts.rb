class AddLockedToRefineryPageParts < ActiveRecord::Migration

  def up
    add_column :refinery_page_parts, :locked, :boolean, :default => false

  end

  def down
    remove_column :refinery_page_parts, :locked

  end

end
