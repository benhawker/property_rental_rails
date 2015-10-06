class AddAttributesToRatings < ActiveRecord::Migration
  def change
  	add_column :ratings, :rating, :integer
  	add_column :ratings, :review, :text
  	add_column :ratings, :recommended, :text
  end
end
