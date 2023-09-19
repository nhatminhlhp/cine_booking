class CreateMovieTheaters < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_theaters do |t|
      t.string :name
      t.string :address
      t.string :province
      t.timestamps
    end
  end
end