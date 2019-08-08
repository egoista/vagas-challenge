FactoryBot.define do
  factory :job_application do
    person
    job_opportunity

    score { rand(100) }
  end
end