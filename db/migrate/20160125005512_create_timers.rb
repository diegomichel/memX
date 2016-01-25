class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.datetime :start
      t.datetime :end
      t.references :list, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
