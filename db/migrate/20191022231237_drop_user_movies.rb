class DropUserMovies < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_movies do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false
      t.integer :rating
    end
  end
end
