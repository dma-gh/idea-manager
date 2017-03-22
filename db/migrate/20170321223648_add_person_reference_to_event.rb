class AddPersonReferenceToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :person, foreign_key: true
  end
end
