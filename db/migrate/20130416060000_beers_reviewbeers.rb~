class BeersReviewbeers < ActiveRecord::Migration
  def up
	create_table :beers_reviewbeers, :id => false do |t|
		t.references :beer, :null => false
		t.references :reviewbeer, :null => false
	end
  end

  def down
  end
end
