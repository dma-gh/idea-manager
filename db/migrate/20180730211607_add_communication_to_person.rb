class AddCommunicationToPerson < ActiveRecord::Migration[5.0]
  def change
  	add_column :people, :communication, :integer
  end
end
