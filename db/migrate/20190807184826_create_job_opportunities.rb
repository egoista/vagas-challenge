class CreateJobOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :job_opportunities do |t|
      t.string :company
      t.string :title
      t.string :description
      t.integer :level
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
