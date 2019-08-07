class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.references :person, foreign_key: true
      t.references :job_opportunity, foreign_key: true

      t.timestamps
    end
  end
end
