class AddReuseToRefineryWidgets < ActiveRecord::Migration

  def change
    add_column :refinery_widgets_widgets, :reuse, :boolean, :default => false
  end

end
