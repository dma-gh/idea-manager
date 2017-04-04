class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :person
  
  validates :content, length: { minimum: 1 }
end
