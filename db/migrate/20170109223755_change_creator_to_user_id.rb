class ChangeCreatorToUserId < ActiveRecord::Migration
  def change
    rename_column :meetups, :creator, :user_id
  end
end
