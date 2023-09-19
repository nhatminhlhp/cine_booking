class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.text :actors
      t.text :description
      t.string :country
      t.string :genre
      t.date :releaseDate
      t.references :movie_theater, foreign_key: true
      t.timestamps
    end
  end
end
