class AddMeetingIdToIssues < ActiveRecord::Migration
  def up
    add_column :issues, :meeting_id, :integer
  end

  def down
    remove_column :issues, :meeting_id
  end
end
