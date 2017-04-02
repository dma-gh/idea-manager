class Project < ApplicationRecord
  has_and_belongs_to_many :people
  has_many :events
  
  validates :description, length: { maximum: 140 }
end
