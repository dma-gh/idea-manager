class Person < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :events
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def competence
  	base = (hanging_skill.to_i + packing_skill.to_i + painting_skill.to_i).to_f / 3
  	upper = base + (renu_skill.to_i * 2 + tech_skill.to_i + batch_skill.to_i + harley_skill.to_i + forklift_skill.to_i + welding_skill.to_i + maintenance_skill.to_i + wash_skill.to_i).to_f / 3

  	if upper <= 5
  		return upper
  	else
  		return 5
  	end
  end
end
