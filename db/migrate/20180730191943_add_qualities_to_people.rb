class AddQualitiesToPeople < ActiveRecord::Migration[5.0]
  def change
  	add_column :people, :painting_skill, :integer
  	add_column :people, :hanging_skill, :integer
  	add_column :people, :packing_skill, :integer
  	add_column :people, :tech_skill, :integer
  	add_column :people, :renu_skill, :integer
  	add_column :people, :batch_skill, :integer
  	add_column :people, :harley_skill, :integer
  	add_column :people, :forklift_skill, :integer
  	add_column :people, :welding_skill, :integer
  	add_column :people, :maintenance_skill, :integer
  	add_column :people, :wash_skill, :integer
  	add_column :people, :year_started, :integer
  end
end
