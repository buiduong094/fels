class AddDesciptionToWord < ActiveRecord::Migration
  def change
    add_column :words, :des, :string
  end
end
