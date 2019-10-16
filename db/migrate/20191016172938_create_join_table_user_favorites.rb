class CreateJoinTableUserFavorites < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :genres do |t|
      # t.index [:user_id, :genre_id]
      # t.index [:genre_id, :user_id]
    end
  end
end
