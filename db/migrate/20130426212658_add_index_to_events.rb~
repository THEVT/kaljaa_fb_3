class AddIndexToEvents < ActiveRecord::Migration
  def change
		add_index :events, [:profile_id, :created_at, :start_time]
  end
end
