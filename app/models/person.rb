class Person < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :events
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def competence
  	base = (hanging_skill + packing_skill + painting_skill).to_f / 3
  	upper = base + (renu_skill * 2 + tech_skill + batch_skill + harley_skill + forklift_skill + welding_skill + maintenance_skill + wash_skill).to_f / 3

  	if upper <= 5
  		return upper
  	else
  		return 5
  	end
  end
end
