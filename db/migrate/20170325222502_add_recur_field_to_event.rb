class AddRecurFieldToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :recur, :boolean
    add_column :events, :recur_often, :string
    add_column :events, :recur_times, :integer
  end
end
