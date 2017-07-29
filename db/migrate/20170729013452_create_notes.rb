class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :des
      t.references :user, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
