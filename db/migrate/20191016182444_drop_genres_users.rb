class DropGenresUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :genres_users do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
    end
  end
end
