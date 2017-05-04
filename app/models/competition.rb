class Competition < ActiveRecord::Base
	has_many :results
	#accepts_nested_attributes_for :results, reject_if: :reject_results
	validates :title, presence: true
	validates :sportType, presence: true, inclusion: { in: %w(corrida dardo) }
	validates :start, presence: true

	#def reject_results(attributes)
	#	attributes['athlete'].blank?
	#end
end
