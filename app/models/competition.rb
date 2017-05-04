class Competition < ActiveRecord::Base
	has_many :results
	validates :title, presence: true
	validates :sportType, presence: true, inclusion: { in: %w(corrida dardo) }
	validates :start, presence: true
end
