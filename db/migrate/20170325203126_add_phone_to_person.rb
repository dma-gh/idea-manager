class AddPhoneToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :phone, :string
    add_column :people, :carrier, :string
  end
end
