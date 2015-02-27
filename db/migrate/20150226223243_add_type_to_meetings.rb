class AddTypeToMeetings < ActiveRecord::Migration
  def up
    add_column :meetings, :meeting_type, :string
  end

  def down
    remove_column :meetings, :meeting_type
  end
end
