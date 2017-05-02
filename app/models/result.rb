class Result < ActiveRecord::Base
	belongs_to :competition
	validates :athlete, presence: true
	validates :resultValue, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	validates :unit, presence: true, length: { maximum: 1 }
end
