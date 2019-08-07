FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    occupation  { Faker::Job.title }
    level { Person.levels.keys.sample }

    location
  end
end