class AddLevelsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :levels, :string,
               default: '0.5,1,2,4,8,16,32,64,128,256'
  end
end
