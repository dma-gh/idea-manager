class AddDeadlineToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :deadline, :datetime, :default => Date.today
  end
end
