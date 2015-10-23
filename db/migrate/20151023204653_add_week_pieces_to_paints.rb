class AddWeekPiecesToPaints < ActiveRecord::Migration
  def change
    add_column :paints, :week, :integer
    add_column :paints, :pieces, :integer
  end
end
