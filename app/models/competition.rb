class Competition < ActiveRecord::Base
	validates :title, presence: true
	validates :sportType, presence: true, inclusion: { in: %w(corrida dardo) }
	validates :start, presence: true
end
