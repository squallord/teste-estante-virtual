class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :athlete
      t.float :value
      t.string :unit

      t.timestamps null: false
    end
  end
end
