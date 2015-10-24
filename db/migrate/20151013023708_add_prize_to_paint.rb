class AddPrizeToPaint < ActiveRecord::Migration
  def change
  	add_column :paints, :price, :decimal
  end
end
