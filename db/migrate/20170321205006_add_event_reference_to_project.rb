class AddEventReferenceToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :project, foreign_key: true
  end
end
