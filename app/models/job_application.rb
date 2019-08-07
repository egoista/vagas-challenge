class JobApplication < ApplicationRecord
  belongs_to :person
  belongs_to :job_opportunity
end
