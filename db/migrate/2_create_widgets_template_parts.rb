class CreateWidgetsTemplateParts < ActiveRecord::Migration

  def up
    create_table :refinery_widgets_template_parts do |t|
      t.string :name
      t.boolean :display, :default => true
      t.boolean :locked, :default => true
      t.integer :template_id

      t.timestamps
    end

  end

  def down
    drop_table :refinery_widgets_template_parts

  end

end
