class Dijkstra

  def initialize
    @unchecked_locations = Location.all.to_a
    @distances_from_source = {}
  end
  
  def shortest_distance_between(source, destiny)
    set_initial_distances(source)
    
    until @unchecked_locations.empty?
      analyzed_location_id, analyzed_distance = unckecked_location_with_lesser_distance

      if(analyzed_location_id == destiny.id)
        break
      end

      @unchecked_locations.delete_if{|location| location.id == analyzed_location_id}
      
      connections_to_unchecked_locations_from(analyzed_location_id).each do |connection|
        connected_location = connection.first_location.id == analyzed_location_id ? connection.second_location : connection.first_location
        previous_distance = @distances_from_source[connected_location.id]
        new_distance = connection.distance + analyzed_distance
        
        if(new_distance < previous_distance)
          @distances_from_source[connected_location.id] = new_distance
        end
      end
    end

    @distances_from_source[destiny.id]
  end

  private

  def unckecked_location_with_lesser_distance
    @distances_from_source.slice(*@unchecked_locations.map(&:id)).sort_by { |key, value| value }.first
  end

  def connections_to_unchecked_locations_from(location_id)
    unchecked_locations_id = @unchecked_locations.map(&:id)
    Connection.from_one_location_to_others(location_id, unchecked_locations_id)
  end

  def set_initial_distances(source)
    @unchecked_locations.map do |location|
      @distances_from_source[location.id] = location == source ? 0 : Float::INFINITY
    end
  end
end