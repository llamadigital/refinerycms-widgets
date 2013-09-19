class CreateWidgetsWidgets < ActiveRecord::Migration

  def up
    create_table :refinery_widgets_widgets do |t|
      t.string :name
      t.boolean :display, :default => true
      t.boolean :locked, :default => false
      t.integer :position, :default => 0
      t.integer :widget_id
      t.string  :container_type
      t.integer :container_id
      t.string  :sub_type
      t.boolean :layout, :default => false
      t.timestamps
    end

  end

  def down
    drop_table :refinery_widgets_widgets

  end

end
