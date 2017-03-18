class JoinPeopleProjects < ActiveRecord::Migration[5.0]
  def change
      create_table :people_projects, id: false do |t|
      t.belongs_to :person, index: true
      t.belongs_to :project, index: true
    end
  end
end
