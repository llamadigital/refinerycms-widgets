class CreateWidgetsTemplates < ActiveRecord::Migration

  def up
    create_table :refinery_widgets_templates do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-widgets"})
    end

    drop_table :refinery_widgets_templates

  end

end
