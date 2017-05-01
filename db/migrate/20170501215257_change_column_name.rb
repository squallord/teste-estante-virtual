class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :competitions, :type, :sportType
  end
end
