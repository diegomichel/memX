class CreateListitems < ActiveRecord::Migration
  def change
    create_table :listitems do |t|
      t.text :text
      t.belongs_to :list, index: true, foreign_key: true
      t.integer :previous_item_id

      t.timestamps null: false
    end
  end
end
