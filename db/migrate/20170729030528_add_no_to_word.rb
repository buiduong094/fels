class AddNoToWord < ActiveRecord::Migration
  def change
    add_column :words, :no, :integer
  end
end
