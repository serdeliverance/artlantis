class AddAttachmentToPaint < ActiveRecord::Migration
  def change
  	add_attachment :paints, :paint
  end
end
