class Connection < ApplicationRecord
  belongs_to :first_location, class_name: 'Location'
  belongs_to :second_location, class_name: 'Location'

  def self.from_one_location_to_others(location_id, unchecked_locations_id)
    includes(:first_location, :second_location).where(
      "(first_location_id = :location_id AND second_location_id IN (:locations_ids))
      OR 
      (second_location_id = :location_id AND first_location_id IN (:locations_ids))",
      {
        location_id: location_id,
        locations_ids: unchecked_locations_id
      }
    )
  end
end
