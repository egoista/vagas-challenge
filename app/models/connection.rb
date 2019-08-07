class Connection < ApplicationRecord
  belongs_to :first_location, class_name: 'Location'
  belongs_to :second_location, class_name: 'Location'
end
