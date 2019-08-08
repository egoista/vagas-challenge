class AddScoreToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :score, :integer
  end
end
