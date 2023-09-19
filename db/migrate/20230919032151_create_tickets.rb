class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :seat
      t.string :room
      t.decimal :price, precision: 10, scale: 2
      t.datetime :showtime
      t.string :status
      t.references :movie, foreign_key: true
      t.references :movie_theater, foreign_key: true
      t.timestamps
    end
  end
end
