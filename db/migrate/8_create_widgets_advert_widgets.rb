class CreateWidgetsAdvertWidgets < ActiveRecord::Migration

  def up
    create_table :refinery_widgets_advert_widgets do |t|
      t.integer :widget_id
      t.integer :image_id
      t.string :name
      t.text :url
    end

  end

  def down
    drop_table :refinery_widgets_advert_widgets

  end

end
