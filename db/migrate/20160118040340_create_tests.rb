class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.belongs_to :list, index: true, foreign_key: true
      t.text :text

      t.timestamps null: false
    end
  end
end
