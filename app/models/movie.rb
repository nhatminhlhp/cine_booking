class Movie < ApplicationRecord
  belongs_to :movie_theater
  has_one_attached :image
end
