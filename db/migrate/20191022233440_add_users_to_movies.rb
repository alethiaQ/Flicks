class AddUsersToMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :user, null: true, foreign_key: true
  end
end
