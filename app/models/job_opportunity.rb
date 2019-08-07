class JobOpportunity < ApplicationRecord
  include ExperienceLevel
  
  belongs_to :location
end
