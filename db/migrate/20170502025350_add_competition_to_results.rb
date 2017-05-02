class AddCompetitionToResults < ActiveRecord::Migration
  def change
    add_reference :results, :competition, index: true, foreign_key: true
  end
end
