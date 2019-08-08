class JobOpportunity < ApplicationRecord
  include ExperienceLevel
  
  belongs_to :location
  has_many :job_applications
  has_many :people, through: :job_applications
end
