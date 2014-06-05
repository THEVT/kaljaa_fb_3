class AddIndexToBeersReviewbeers < ActiveRecord::Migration
  def change
	add_index(:beers_reviewbeers, [:beer_id, :reviewbeer_id], :unique => true)
  end
end
