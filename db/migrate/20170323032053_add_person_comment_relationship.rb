class AddPersonCommentRelationship < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :person, foreign_key: true
  end
end
