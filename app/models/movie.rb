class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many :ratings , dependent: :destroy
  has_one_attached :cover
end
