class CreateMilestones < ActiveRecord::Migration[7.2]
  def change
    create_table :milestones do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :project, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
