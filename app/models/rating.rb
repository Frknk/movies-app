class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :value, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :user_id, uniqueness: { scope: :movie_id, message: "has already rated this movie" }
end
