class AddCompleteToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :complete, :boolean, :default => false
  end
end
