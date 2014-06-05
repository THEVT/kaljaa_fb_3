class AddIndexToInvites < ActiveRecord::Migration
  def change
	add_index :invites, [:profile_id, :event_id]
  end
end
