class Result < ActiveRecord::Base
	validates :athlete, presence: true
	validates :value, presence: true
	validates :unit, presence: true, length: { maximum: 1 }
end
