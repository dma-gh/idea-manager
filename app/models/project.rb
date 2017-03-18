class Project < ApplicationRecord
  has_and_belongs_to_many :people
  
  validates :description, length: { maximum: 50 }
end
