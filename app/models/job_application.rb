class JobApplication < ApplicationRecord
  belongs_to :person
  belongs_to :job_opportunity

  def set_score
    score = (calculate_N + calculate_D) / 2

    update(score: score)
  end

  def as_json
    {
      "nome": person.name,
      "profissao": person.occupation,
      "localizacao": person.location.name,
      "nivel": Person.levels[person.level],
      "score": score
    }
  end

  private

  def calculate_N
    nv = Person.levels[person.level]
    nc = JobOpportunity.levels[job_opportunity.level]
    100 - 25 * ( nv - nc ).abs
  end

  def calculate_D
    distance = Dijkstra.new.shortest_distance_between(person.location, job_opportunity.location)

    case distance
    when 0..5
      100
    when 5..10
      75
    when 10..15
      50
    when 15..20
      25
    else
      0
    end
  end
end
