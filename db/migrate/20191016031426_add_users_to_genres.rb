class AddUsersToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :user_id, :integer
  end
end
