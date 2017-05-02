class ChangeColumnName2 < ActiveRecord::Migration
  def change
  	rename_column :results, :value, :resultValue
  end
end
