class CreatePaints < ActiveRecord::Migration
  def change
    create_table :paints do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps null: false
    end
  end
end
