FactoryBot.define do
  factory :job_opportunity do
    company { Faker::Company.name }
    title  { Faker::Job.title }
    level { Person.levels.keys.sample }
    description { Faker::Job.title }

    location
  end
end