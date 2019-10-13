class CreateMoviesGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :movies_genres do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :genre, null: false, foreign_key: true
    end
  end
end
