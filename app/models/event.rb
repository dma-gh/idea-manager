class Event < ApplicationRecord
  belongs_to :project
  belongs_to :person
  has_many :comments
end
