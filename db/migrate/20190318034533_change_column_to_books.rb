class ChangeColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :title, :string, null:false
    change_column :books, :opinion, :text, null:false
  end
end
