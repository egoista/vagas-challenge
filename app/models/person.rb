class Person < ApplicationRecord
  include ExperienceLevel
  
  belongs_to :location
end
