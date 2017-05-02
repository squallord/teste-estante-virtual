class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :title
      t.string :type
      t.timestamp :start
      t.timestamp :end
      t.timestamps null: false
    end
  end
end