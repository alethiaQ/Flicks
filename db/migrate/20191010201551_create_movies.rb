class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.text :preview
      t.string :actors
      t.string :director
      t.string :release_date
    end
  end
end
