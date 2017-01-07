class CreateAttendees < ActiveRecord::Migration
  def change
    create_join_table :users, :meetups, table_name: :attendees
  end
end
