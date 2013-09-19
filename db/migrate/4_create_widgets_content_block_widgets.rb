class CreateWidgetsContentBlockWidgets < ActiveRecord::Migration

  def up
    create_table :refinery_widgets_content_block_widgets do |t|
      t.integer :widget_id
      t.text :content
    end

  end

  def down
    drop_table :refinery_widgets_content_block_widgets

  end

end
