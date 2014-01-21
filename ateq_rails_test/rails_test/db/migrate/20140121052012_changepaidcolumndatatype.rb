class Changepaidcolumndatatype < ActiveRecord::Migration
  def change
    change_column :charges , :paid, :string
  end
end
