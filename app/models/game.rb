class Game < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	belongs_to :year
	has_many :reviews, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
end
