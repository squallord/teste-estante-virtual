class Result < ActiveRecord::Base
	belongs_to :competition
	validates :athlete, presence: true
	validates :value, presence: true
	validates :unit, presence: true, length: { maximum: 1 }
end
